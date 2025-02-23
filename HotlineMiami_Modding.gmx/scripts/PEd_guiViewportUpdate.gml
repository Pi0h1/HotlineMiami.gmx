/// PEd_guiViewportUpdate(viewport)
/**
 * @brief Updates the viewport.
 * @param {real} viewport The id of the viewport.
 */
var _viewport = argument0;
PEd_guiShapeUpdate(_viewport);

// Resize viewport
var _width = max(viewportWidth, 1);
var _height = max(viewportHeight, 1);

if (global.pedUsing3D) 
{
    view_wview[0] = _width;
    view_hview[0] = _height;
}
else 
{
    view_wport[0] = _width;
    view_hport[0] = _height;
    view_wview[0] = view_wport[0] * viewZoom;
    view_hview[0] = view_hport[0] * viewZoom;
}

if (surface_get_width(application_surface) != _width
    || surface_get_height(application_surface) != _height)
{
    surface_resize(application_surface, _width, _height);
}
