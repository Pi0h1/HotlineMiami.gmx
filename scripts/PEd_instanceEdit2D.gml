/// PEd_instanceEdit2D()
/**
 * @brief Handles 2D instance editing.
 */
// Save old transformations
var _oldRotZ = 0;
var _oldScaleX = 0;
var _oldScaleY = 0;
var _room = PEd_getCurrentRoom();
var _selectedObj = PEd_getSelectedObject();

if (_selectedObj > 0) 
{
    if (editMode == PEdEditModes.Object) 
    {
        if (instance_exists(_selectedObj))
        {
            _oldRotZ = PEd_instanceGetRotZ(_selectedObj);
            _oldScaleX = PEd_instanceGetScaleX(_selectedObj);
            _oldScaleY = PEd_instanceGetScaleY(_selectedObj);
        }
        else
        {
            PEd_actClearSelection();
            _selectedObj = 0;
        }
    }
    else if (editMode == PEdEditModes.Tile)
    {
        if (tile_exists(_selectedObj))
        {
            _oldRotZ = 0;
            _oldScaleX = tile_get_xscale(_selectedObj);
            _oldScaleY = tile_get_yscale(_selectedObj);
        }
        else
        {
            PEd_actClearSelection();
            _selectedObj = 0;
        }
    }
}

var _tileAddScaleX = 0;
var _tileAddScaleY = 0;

if (mouseInViewport) 
{
    ////////////////////////////////////////////////////////////////////////////
    //
    // Control pivot
    //
    if (mouse_check_button(mb_left)
        && editAxis != PEdAxes.None) 
    {
        var _valX = (windowMouseX - viewportX + mouseOff[0]) * viewZoom + view_xview[0];
        var _valY = (windowMouseY - viewportY + mouseOff[1]) * viewZoom + view_yview[0];
        
        if (editAxis == PEdAxes.All
            && editNow == 1
            && editMode == PEdEditModes.Object)
        {
            // Rotate
            PEd_instanceAddRotZ(_selectedObj, windowMouseX - mouseLastX);
        }
        else
        {
            if (editAxis & PEdAxes.X)
            {
                if (editNow == PEdTools.Move) 
                {
                    // Move
                    PEd_oPivot.x = _valX;
                }
                else if (editNow == PEdTools.Scale
                    && _selectedObj > 0) 
                {
                    // Scale
                    var _scale = (windowMouseX - mouseLastX) * viewZoom / 10
                               + (windowMouseY - mouseLastY) * viewZoom / 10;
                    
                    if (editMode == PEdEditModes.Object) 
                    {
                        PEd_instanceAddScaleX(_selectedObj, _scale);
                    }
                    else if (editMode == PEdEditModes.Tile) 
                    {
                        _tileAddScaleX = _scale;
                        tile_set_scale(_selectedObj,
                                       tile_get_xscale(_selectedObj) + _scale,
                                       tile_get_yscale(_selectedObj));
                    }
                }
            }
            
            if (editAxis & PEdAxes.Y)
            {
                if (editNow == PEdTools.Move) 
                {
                    // Move
                    PEd_oPivot.y = _valY;
                }
                else if (editNow == PEdTools.Scale
                    && _selectedObj > 0) 
                {
                    // Scale
                    var _scale = (windowMouseX - mouseLastX) * viewZoom / 10
                               + (windowMouseY - mouseLastY) * viewZoom / 10;
                    
                    if (editMode == PEdEditModes.Object) 
                    {
                        PEd_instanceAddScaleY(_selectedObj, _scale);
                    }
                    else if (editMode == PEdEditModes.Tile)
                    {
                        _tileAddScaleY = _scale;
                        tile_set_scale(_selectedObj,
                                       tile_get_xscale(_selectedObj),
                                       tile_get_yscale(_selectedObj) + _scale);
                    }
                }
            }
        }
            
        // Snap to grid
        if (PEd_roomGetGrid(_room)
            && !keyboard_check(vk_alt)) 
        {
            PEd_oPivot.x = round(PEd_oPivot.x / PEd_roomGetSnapH(_room)) * PEd_roomGetSnapH(_room);
            PEd_oPivot.y = round(PEd_oPivot.y / PEd_roomGetSnapV(_room)) * PEd_roomGetSnapV(_room);
        }
    }
}

////////////////////////////////////////////////////////////////////////////////
//
// Apply transformations
//
if (_selectedObj > 0) 
{
    var _data = selectedObjectsData[| 0];
    if (editMode == PEdEditModes.Object) 
    {
        PEd_instanceSetPosX(_selectedObj, PEd_oPivot.x + _data[0]);
        PEd_instanceSetPosY(_selectedObj, PEd_oPivot.y + _data[1]);
    }
    else if (editMode == PEdEditModes.Tile)
    {
        tile_set_position(_selectedObj, PEd_oPivot.x + _data[0], PEd_oPivot.y + _data[1]);
    }
    PEd_guiRequestRedrawAll(guiRoot)
}

var _size = ds_list_size(selectedObjects);
for (var i = 1; i < _size; i++) 
{
    var _id = selectedObjects[| i];
    var _data = selectedObjectsData[| i];
    if (editMode == PEdEditModes.Object) 
    {
        PEd_instanceSetPosX(_id, PEd_oPivot.x + _data[0]);
        PEd_instanceSetPosY(_id, PEd_oPivot.y + _data[1]);
        PEd_instanceAddRotZ(_id, PEd_instanceGetRotZ(_selectedObj) - _oldRotZ);
        PEd_instanceAddScaleX(_id, PEd_instanceGetScaleX(_selectedObj) - _oldScaleX);
        PEd_instanceAddScaleY(_id, PEd_instanceGetScaleY(_selectedObj) - _oldScaleY);
    }
    else if (editMode == PEdEditModes.Tile)
    {
        tile_set_position(_id, PEd_oPivot.x + _data[0], PEd_oPivot.y + _data[1]);
        tile_set_scale(_id,
                       tile_get_xscale(_id) + _tileAddScaleX,
                       tile_get_yscale(_id) + _tileAddScaleY);
    }
}
    
////////////////////////////////////////////////////////////////////////////////
//
// Stop editing
//
if (mouse_check_button_released(mb_left)) 
{
    editAxis = PEdAxes.None;
    editNow = PEdTools.None;
}
