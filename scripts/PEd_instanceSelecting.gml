/// PEd_instanceSelecting()
/**
 * @brief Handles instance selecting.
 */
if (!mouseInViewport
    || (editMode == PEdEditModes.Tile
        && keyboard_check(vk_control)))
{
    return 0;
}

var _room = PEd_getCurrentRoom();
var _releasedRMB = mouse_check_button_released(mb_right);

if (mouse_check_button_pressed(mb_left)
    || (_releasedRMB
    && windowMouseX == guiMousePressX
    && windowMouseY == guiMousePressY))
{
    var _surColSelect = surface_create(viewportWidth, viewportHeight);
    
    // Draw to the surface
    surface_set_target(_surColSelect);
    draw_clear(c_black);
    PEd_cameraSetProjection();
    shader_set(PEd_shInstSelect);
    
    // Draw objects
    if (editMode == PEdEditModes.Object)
    {
        var _instances = PEd_roomGetInstances(_room);
        for (var i = ds_list_size(_instances) - 1; i >= 0; i--)
        {
            with (_instances[| i])
            {
                if (visible)
                {
                    var _color = id - 100000;
                    shader_set_uniform_f(shader_get_uniform(PEd_shInstSelect, "uColour"),
                                         colour_get_red(_color) / 255,
                                         colour_get_green(_color) / 255,
                                         colour_get_blue(_color) / 255);
                    if ((sprite_index != -1
                        && !global.pedUsing3D)
                        || object_is_ancestor(object_index, PEd_oObject2D)
                        || object_index == PEd_oObject2D) 
                    {
                        draw_self();
                    }
                    event_perform(ev_draw, 0);
                }
            }
        }
    }
    
    // Draw pivot
    with (PEd_oPivot)
    {
        var _color = id - 100000;
        shader_set_uniform_f(shader_get_uniform(PEd_shInstSelect, "uColour"),
                             colour_get_red(_color) / 255,
                             colour_get_green(_color) / 255,
                             colour_get_blue(_color) / 255);
        event_perform(ev_draw, 0);
    }
    
    shader_reset();
    surface_reset_target();
    
    // Colour at mouse coordinate
    var _colSelect = surface_getpixel(_surColSelect, windowMouseX - viewportX, windowMouseY - viewportY);
    var _id = (_colSelect + 100000) * (_colSelect > 0);
    if (!instance_exists(_id))
    {
        _id = 0;
    }
    
    ////////////////////////////////////////////////////////////////////////////
    // Pivot was clicked
    if (_id == PEd_oPivot.id)
    {
        surface_set_target(_surColSelect);
        draw_clear(c_black);
        PEd_cameraSetProjection();
        
        // Draw pivot
        with (PEd_oPivot) { event_perform(ev_draw, 0); }
        surface_reset_target();

        // Select axis
        editAxis = surface_getpixel(_surColSelect, windowMouseX - viewportX, windowMouseY - viewportY);
        
        // Save mouse offset from the pivot
        if (editAxis != PEdAxes.None)
        {
            if (global.pedUsing3D)
            {
                var _mouse;
                var _pivot = PEd_vec3(PEd_oPivot.x, PEd_oPivot.y, PEd_oPivot.z);
                
                if (editAxis != PEdAxes.Z) 
                {
                    _mouse = PEd_rayPlaneIntersect(PEd_vec3(x, y, z),
                                                   PEd_mouseRay3D(),
                                                   _pivot,
                                                   PEd_vec3(0, 0, 1));
                }
                else 
                {
                    _mouse = PEd_rayPlaneIntersect(PEd_vec3(x, y, z),
                                                   PEd_mouseRay3D(),
                                                   _pivot,
                                                   PEd_vec3Normalize(PEd_vec3(x - PEd_oPivot.x, y - PEd_oPivot.y, 0)));
                }
                                                    
                mouseOff = PEd_vec3Subtract(_pivot, _mouse); 
                mouseLast = _mouse;
            }
            else
            {
                var _x = viewportX + ((PEd_oPivot.x - view_xview[0]) / viewZoom);
                var _y = viewportY + ((PEd_oPivot.y - view_yview[0]) / viewZoom);
                mouseOff = PEd_vec3(_x - windowMouseX, _y - windowMouseY, 0);
            }
            
            editNow = editTool;
        }
    }
    else
    {
        switch (editMode)
        {
            case PEdEditModes.Object:
                // Select instance
                PEd_selectObject(_id, false, _releasedRMB);
                break;
                
            case PEdEditModes.Tile:
                // Select tile
                var _mX = (windowMouseX - viewportX) * viewZoom + view_xview[0];
                var _mY = (windowMouseY - viewportY) * viewZoom + view_yview[0];
                var _tile = tile_layer_find(tileDepth, _mX, _mY);
                    
                if (!tile_exists(_tile))
                {
                    _tile = 0;
                }
                PEd_selectObject(_tile, false, _releasedRMB);
                break;
        }
        
        // Open context menu for objects
        if (_releasedRMB
            && PEd_guiCanShowContextMenu()
            && ds_list_size(selectedObjects) > 0)
        {
            var _contextMenu = PEd_guiCreateContextMenu();
            PEd_guiMenuObjectEdit(_contextMenu);
            PEd_guiAddItem(_contextMenu,
                PEd_guiCreateContextMenuItem("Move pivot here", PEd_actMovePivotHere, ksMovePivotHere, "Move pivot at this position."));
            PEd_guiShowContextMenu(_contextMenu);
        }
    }
    
    // Redraw all
    PEd_guiRequestRedrawAll(guiRoot)
    
    // Free surface from memory
    surface_free(_surColSelect);
}
