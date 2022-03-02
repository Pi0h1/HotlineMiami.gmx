/// PEd_getMouseWorldPosition([room])
/**
 * @brief Gets the world position of the mouse cursor.
 * @param {real} [room] The id of the room. If specified then
 *                      the positon is snapped to it's grid (if
 *                      snapping is enabled).
 * @return {vec3} The world position of the mouse cursor.
 */
var _room = noone;
if (argument_count > 0)
{
    _room = argument[0];
}
with (PEd_oEditor)
{
    var _space;
    if (global.pedUsing3D) 
    {
        _space = PEd_cameraScreenToPlaneXY(windowMouseX, windowMouseY, PEd_oPivot.z);
    }
    else
    { 
        _space = PEd_vec3((windowMouseX - viewportX) * viewZoom + view_xview[0], 
                          (windowMouseY - viewportY) * viewZoom + view_yview[0],
                           0);
    }
    
    if (_room != noone
        && PEd_roomGetGrid(_room))
    {
        _space[0] = round(_space[0] / PEd_roomGetSnapH(_room)) * PEd_roomGetSnapH(_room);
        _space[1] = round(_space[1] / PEd_roomGetSnapV(_room)) * PEd_roomGetSnapV(_room);
        _space[2] = round(_space[2] / PEd_roomGetSnapD(_room)) * PEd_roomGetSnapD(_room);
    }
    
    return _space;
}
show_error("PEd_oEditor does not exist!", true);
