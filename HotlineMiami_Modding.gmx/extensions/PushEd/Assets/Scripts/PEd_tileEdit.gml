/// PEd_tileEdit()
/**
 * @brief Handles _tile editing.
 * @note Use only in 2D mode!
 */
if (!mouseInViewport
    || editMode != PEdEditModes.Tile) 
{
    return 0;
}
 
var _mouseX = windowMouseX;
var _mouseY = windowMouseY;
var _room = PEd_getCurrentRoom();

////////////////////////////////////////////////////////////////////////////////
//
// Tile creating
//

// Drop tile
if (keyboard_check(vk_control)
    && mouse_check_button(mb_left)) 
{
    // Create _tile
    if (mouse_check_button_pressed(mb_left)
        || (keyboard_check(vk_shift)
            && mouseLastX != _mouseX
            && mouseLastY != _mouseY)) 
    {
        var _posX, _posY;
        
        if (PEd_roomGetGrid(_room)
            && !keyboard_check(vk_alt)) 
        {
            // Snap to grid
            _posX = floor(((_mouseX - viewportX) * viewZoom + view_xview[0]) / PEd_roomGetSnapH(_room)) * PEd_roomGetSnapH(_room);
            _posY = floor(((_mouseY - viewportY) * viewZoom + view_yview[0]) / PEd_roomGetSnapV(_room)) * PEd_roomGetSnapV(_room);
        }
        else 
        {
            // No snapping
            _posX = (_mouseX - viewportX) * viewZoom + view_xview[0];
            _posY = (_mouseY - viewportY) * viewZoom + view_yview[0];
        }
        
        // Delete underlying
        if (tileDeleteUnderlying) 
        {
            var _tile = tile_layer_find(tileDepth, _posX, _posY);
            if (_tile != - 1) 
            {
                PEd_tileDelete(_tile);
            }
        }
        
        // Add new tile
        var _tile = PEd_createTile(_room, tileBground, tilePartX, tilePartY, tilePartW, tilePartH, _posX, _posY, tileDepth);
            
        // Set _tile colour and alpha
        tile_set_blend(_tile, tileColour);   
        tile_set_alpha(_tile, tileAlpha);
        
        // Add new depth layer if it does not exist
        if (ds_list_find_index(tileLayers, tileDepth) == - 1) 
        {
            ds_list_add(tileLayers, tileDepth);
            ds_list_add(tileVisible, true);
            tileLayerSelected = ds_list_size(tileLayers) - 1;
            PEd_guiRequestRedrawAll(guiRoot)
        }
        
        tile_set_visible(_tile, ds_list_find_value(tileVisible, ds_list_find_index(tileLayers, tileDepth)));
        
        // Save tile id
        if (!keyboard_check(vk_shift)) 
        {
            pedDnDInstance = _tile;
        }
    }
}

if (!tile_exists(pedDnDInstance)) 
{
    pedDnDInstance = noone;
}

// Move dropped tile
if (pedDnDInstance != noone) 
{
    if (mouse_check_button(mb_left)) 
    {
        if (PEd_roomGetGrid(_room)
            && !keyboard_check(vk_alt)) 
        {
            // Snap to grid
            tile_set_position(pedDnDInstance, 
                              floor(((_mouseX - viewportX) * viewZoom + view_xview[0]) / PEd_roomGetSnapH(_room)) * PEd_roomGetSnapH(_room),
                              floor(((_mouseY - viewportY) * viewZoom + view_yview[0]) / PEd_roomGetSnapV(_room)) * PEd_roomGetSnapV(_room));
        }
        else 
        {
            // No snapping
            tile_set_position(pedDnDInstance, 
                              floor((_mouseX - viewportX) * viewZoom + view_xview[0]),
                              floor((_mouseY - viewportY) * viewZoom + view_yview[0]));
        }
    }
    else 
    {
        PEd_selectObject(pedDnDInstance, true);
        PEd_oPivot.x = tile_get_x(pedDnDInstance);
        PEd_oPivot.y = tile_get_y(pedDnDInstance);
        pedDnDInstance = noone;
    }
}
else 
{
    // Tile deleting
    if (keyboard_check(vk_control)
        && mouse_check_button(mb_right)
        && !keyboard_check(vk_alt))
    {   
        var _tile = tile_layer_find(tileDepth,
                                    (_mouseX - viewportX) * viewZoom
                                    + view_xview[0], (_mouseY - viewportY) * viewZoom + view_yview[0]);
            
        if (_tile != - 1) 
        {
            PEd_tileDelete(_tile);
            PEd_actClearSelection();
            PEd_guiRequestRedrawAll(guiRoot)
        }
    }
}
