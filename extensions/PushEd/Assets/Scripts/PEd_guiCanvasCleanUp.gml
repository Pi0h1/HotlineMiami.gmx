/// PEd_guiCanvasCleanUp(canvas)
/**
 * @brief Frees canvas resources from memory.
 * @param {real} canvas The id of the canvas.
 */
var _surface = argument0[? "surface"];
if (surface_exists(_surface))
{
    surface_free(_surface);
}
PEd_guiCompoundShapeCleanUp(argument0);
