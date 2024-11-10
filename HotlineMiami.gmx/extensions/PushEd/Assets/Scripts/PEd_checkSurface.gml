/// PEd_checkSurface(surface, width, height)
/**
 * @brief Checks whether the surface exists and if it has correct size.
 *        Broken surfaces are recreated. Surfaces of wrong size are resized.
 * @param {real} surface The id of the surface.
 * @param {real} width   The desired width of the surface.
 * @param {real} height  The desired height of the surface.
 * @return {real} The surface id.
 */
var _surface = argument0;
var _width = max(argument1, 1);
var _height = max(argument2, 1);
if (surface_exists(_surface))
{
    if (surface_get_width(_surface) != _width
        || surface_get_height(_surface) != _height)
    {
        surface_resize(_surface, _width, _height);
    }
}
else
{
    _surface = surface_create(_width, _height);
}
return _surface;
