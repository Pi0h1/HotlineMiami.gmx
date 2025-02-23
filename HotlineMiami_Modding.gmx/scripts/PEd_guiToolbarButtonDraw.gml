/// PEd_guiToolbarButtonDraw(toolbarButton)
/**
 * @brief Draws the toolbar button.
 * @param {real} toolbarButton The id of the toolbar button.
 */
var _button = argument0;
var _x = PEd_guiShapeGetX(_button);
var _y = PEd_guiShapeGetY(_button);
var _width = PEd_guiShapeGetWidth(_button);
var _height = PEd_guiShapeGetHeight(_button);
var _backgroundColour = PEdColour.WindowBackground;

if (PEd_guiShapeIsHovered(_button))
{
    _backgroundColour = PEdColour.Highlight;
}
PEd_guiDrawRectangle(_x, _y, _width, _height, _backgroundColour);

if (_button[? "highlight"])
{
    PEd_guiDrawRectangle(_x, _y + _height - 4, _width, 4, PEdColour.Active);
}

draw_sprite(_button[? "sprite"], _button[? "subimage"], _x, _y);
