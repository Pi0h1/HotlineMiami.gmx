/// PEd_cameraSetProjection([disable2D])
/**
 * @brief Sets projection to the editor's camera and stores WVP matrices.
 * @param {bool} [disable2D] Set to true to disable using orthographic projection when in 2D mode.
 */
var _disable2D = false;
if (argument_count > 0)
{
    _disable2D = argument[0];
}
with (PEd_oEditor)
{
    if (global.pedUsing3D) 
    {
        var _dir = PEd_cameraGetDirVec3();
        var _up  = PEd_cameraGetUpVec3();
        d3d_set_projection_ext(x, y, z,
                               x + _dir[0],
                               y + _dir[1],
                               z + _dir[2],
                               _up[0], _up[1], _up[2],
                               camFOV, viewportWidth / viewportHeight,
                               camClipNear, camClipFar);
    }
    else if (!_disable2D)
    {
        d3d_set_projection_ortho(view_xview[0], view_yview[0], viewportWidth * viewZoom, viewportHeight * viewZoom, 0);
    }
    
    matWorld      = matrix_get(matrix_world);
    matView       = matrix_get(matrix_view);
    matProjection = matrix_get(matrix_projection);
    
    return true;
}
show_error("PEd_oEditor does not exist!", true);
