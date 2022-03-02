/// PEd_instanceEdit3D()
/**
 * @brief Handles 3D instance editing.
 */
// Save old transformations
var _oldScaleX   = 0;
var _oldScaleY   = 0;
var _oldScaleZ   = 0;
var _room        = PEd_getCurrentRoom();
var _selectedObj = PEd_getSelectedObject();

if (_selectedObj > 0) 
{
    _oldScaleX = PEd_instanceGetScaleX(_selectedObj);
    _oldScaleY = PEd_instanceGetScaleY(_selectedObj);
    _oldScaleZ = PEd_instanceGetScaleZ(_selectedObj);
}

if (mouseInViewport) 
{
    ////////////////////////////////////////////////////////////////////////////
    //
    // Control pivot
    //
    if (mouse_check_button(mb_left)
        && editAxis != PEdAxes.None) 
    {
        // Get 3D mouse position
        if (editAxis != PEdAxes.Z) 
            _planeNormal = PEd_vec3(0, 0, 1);
        else 
            _planeNormal = PEd_vec3Normalize(PEd_vec3(x - PEd_oPivot.x, y - PEd_oPivot.y, 0));
            
        var _mouse = PEd_rayPlaneIntersect(PEd_cameraGetPosVec3(),
                                           PEd_cameraUnprojectVec2(PEd_vec2(windowMouseX, windowMouseY)),
                                           PEd_vec3(PEd_oPivot.x, PEd_oPivot.y, PEd_oPivot.z),
                                           _planeNormal);
    
        switch (editAxis) 
        {
        ////////////////////////////////////////////////////////////////////////
        // X axis
        case PEdAxes.X:
            if (editNow == PEdTools.Move) 
            {
                PEd_oPivot.x = _mouse[0] + mouseOff[0];
            }
            else if (_selectedObj > 0) 
            {
                if (editNow == PEdTools.Rotate) 
                {
                    var _angle = mouseLastX - windowMouseX;
                    if (PEd_oEditor.x < PEd_oPivot.x) 
                        _angle = - _angle;
                    PEd_instanceAddRotX(_selectedObj, _angle);
                }
                else  if (editNow == PEdTools.Scale) 
                {
                    PEd_instanceAddScaleX(_selectedObj, _mouse[0] - mouseLast[0]);
                }
            }
            break;
                
        ////////////////////////////////////////////////////////////////////////
        // Y axis
        case PEdAxes.Y:
            if (editNow == PEdTools.Move) 
            {
                PEd_oPivot.y = _mouse[1] + mouseOff[1];
            }
            else if (_selectedObj > 0) 
            {
                if (editNow == PEdTools.Rotate) 
                {
                    var _angle = mouseLastX - windowMouseX;
                    if (PEd_oEditor.y < PEd_oPivot.y) 
                        _angle = - _angle;
                    PEd_instanceAddRotY(_selectedObj, _angle);
                }
                else if (editNow = PEdTools.Scale)
                {
                    PEd_instanceAddScaleY(_selectedObj, _mouse[1] - mouseLast[1]);
                }
            }
            break;
                
        ////////////////////////////////////////////////////////////////////////
        // Z axis
        case PEdAxes.Z:
            if (editNow == PEdTools.Move) 
            {
                PEd_oPivot.z = _mouse[2] + mouseOff[2];
            }
            else if (_selectedObj > 0) 
            {
                if (editNow == PEdTools.Rotate) 
                    PEd_instanceAddRotZ(_selectedObj, windowMouseX - mouseLastX);
                else if (editNow == PEdTools.Scale)
                    PEd_instanceAddScaleZ(_selectedObj, _mouse[2] - mouseLast[2]);
            }
            break;
            
        ////////////////////////////////////////////////////////////////////////
        // Multiple axis
        case PEdAxes.All:
            if (editNow == PEdTools.Move) 
            {
                PEd_oPivot.x = _mouse[0] + mouseOff[0];
                PEd_oPivot.y = _mouse[1] + mouseOff[1];
            }
            else if (editNow == PEdTools.Scale
                && _selectedObj > 0) 
            {
                var _s = PEd_vec3Length(PEd_vec3Subtract(_mouse, mouseLast)) * sign(_mouse[0] - mouseLast[0]);
                PEd_instanceAddScaleX(_selectedObj, _s);
                PEd_instanceAddScaleY(_selectedObj, _s);
                PEd_instanceAddScaleZ(_selectedObj, _s);
            }
            break;
        }
            
        // Snap to grid
        if (PEd_roomGetGrid(_room)
            && !keyboard_check(vk_alt)) 
        {
            PEd_oPivot.x = round(PEd_oPivot.x / PEd_roomGetSnapH(_room)) * PEd_roomGetSnapH(_room);
            PEd_oPivot.y = round(PEd_oPivot.y / PEd_roomGetSnapV(_room)) * PEd_roomGetSnapV(_room);
            PEd_oPivot.z = round(PEd_oPivot.z / PEd_roomGetSnapD(_room)) * PEd_roomGetSnapD(_room);
        }
        
        // Save mouse last position
        mouseLast = _mouse;
    }
}

////////////////////////////////////////////////////////////////////////////////
//
// Apply transformations
//
if (_selectedObj > 0) 
{
    var _data = selectedObjectsData[| 0];
    PEd_instanceSetPosX(_selectedObj, PEd_oPivot.x + _data[0]);
    PEd_instanceSetPosY(_selectedObj, PEd_oPivot.y + _data[1]);
    PEd_instanceSetPosZ(_selectedObj, PEd_oPivot.z + _data[2]);
    PEd_guiRequestRedrawAll(guiRoot)
}

var _size = ds_list_size(selectedObjects);
for (var i = 1; i < _size; i++) 
{
    var _id = selectedObjects[| i];
    var _data = selectedObjectsData[| i];
    PEd_instanceSetPosX(_id, PEd_oPivot.x + _data[0]);
    PEd_instanceSetPosY(_id, PEd_oPivot.y + _data[1]);
    PEd_instanceSetPosZ(_id, PEd_oPivot.z + _data[2]);
    
    // Apply rotations
    if (editNow == PEdTools.Rotate
        && mouseInViewport) 
    {
        if (editAxis == PEdAxes.X) 
        {
            var _angle = mouseLastX - windowMouseX;
            if (PEd_oEditor.x < PEd_oPivot.x) 
                _angle = -_angle;
            PEd_instanceAddRotX(_id, _angle);
        }
        else if (editAxis == PEdAxes.Y) 
        {
            var _angle = mouseLastX - windowMouseX;
            if (PEd_oEditor.y < PEd_oPivot.y) 
                _angle = -_angle;
            PEd_instanceAddRotY(_id, _angle);
        }
        else if (editAxis == PEdAxes.Z) 
        {
            var _angle = windowMouseX - mouseLastX;
            PEd_instanceAddRotZ(_id, _angle);
        }
    }
    
    // Scale
    PEd_instanceAddScaleX(_id, PEd_instanceGetScaleX(_selectedObj) - _oldScaleX);
    PEd_instanceAddScaleY(_id, PEd_instanceGetScaleY(_selectedObj) - _oldScaleY);
    PEd_instanceAddScaleZ(_id, PEd_instanceGetScaleZ(_selectedObj) - _oldScaleZ);
}
    
////////////////////////////////////////////////////////////////////////////////
//
// Stop editing
//
if (mouse_check_button_released(mb_left)) 
{
    editAxis = 0;
    editNow = -1;
}
