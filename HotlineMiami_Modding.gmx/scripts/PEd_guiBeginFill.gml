/// PEd_guiBeginFill(canvas)
/**
 * @brief Sets the canvas surface as the render target.
 * @param {real} canvas The id of the canvas.
 * @return {bool} True if the surface has been set as the render target.
 */
var _canvas = argument0;
 
////////////////////////////////////////////////////////////////////////////////
// Check surface
var _surface = PEd_guiCanvasGetSurface(_canvas);
var _width = max(PEd_guiShapeGetWidth(_canvas), 1);
var _height = max(PEd_guiShapeGetHeight(_canvas), 1);

if (surface_exists(_surface))
{
    if (surface_get_width(_surface) != _width
        || surface_get_height(_surface) != _height)
    {
        surface_resize(_surface, _width, _height);
        PEd_guiRequestRedraw(_canvas);
    }
}
else
{
    _surface = surface_create(_width, _height);
    PEd_guiRequestRedraw(_canvas);
}
PEd_guiCanvasSetSurface(_canvas, _surface);

////////////////////////////////////////////////////////////////////////////////
// Start filling
if (PEd_guiShapeGetRedraw(_canvas)
    && !guiShapeFilling)
{
    PEd_guiShapeSetRedraw(_canvas, false);
    var _scrollX = 0;
    var _scrollY = 0;
    var _scrollbarHor = _canvas[? "scrollbarHor"]
    var _scrollbarVer = _canvas[? "scrollbarVer"];
    if (!is_undefined(_scrollbarHor))
    {
        _scrollX = PEd_guiScrollbarGetScroll(_scrollbarHor)
            * PEd_guiScrollbarIsVisible(_scrollbarHor);
    }
    if (!is_undefined(_scrollbarVer))
    {
        _scrollY = PEd_guiScrollbarGetScroll(_scrollbarVer)
            * PEd_guiScrollbarIsVisible(_scrollbarVer);
    }
    surface_set_target(_surface);
    draw_clear(PEd_guiCanvasGetBackground(_canvas));
    PEd_guiMatrixSet(-_scrollX, -_scrollY);
    guiShapeFilling = _canvas;
    guiShapeId = 0;
    return true;
}
return false;
