/// PEd_guiCanvasDraw(canvas)
/**
 * @brief Draws the canvas.
 * @param {canvas} The id of the canvas.
 */
var _surface = PEd_guiCanvasGetSurface(argument0);
if (surface_exists(_surface))
{
    draw_surface(_surface,
        PEd_guiShapeGetX(argument0),
        PEd_guiShapeGetY(argument0));
}
