/// PEd_guiDrawCheckbox(x, y, state)
/**
 * @brief Draws a checkbox at the given position.
 * @param {real} x     The x position to draw the checkbox at.
 * @param {real} y     The y position to draw the checkbox at.
 * @param {bool} state The current state of the checkbox.
 * @return {bool} Return the new state of the checkbox.
 */
var _delegate = guiShapeFilling;
var _sprite = PEd_guiSprCheckbox;
var _state = argument2;
var _width = sprite_get_width(_sprite);
var _height = sprite_get_height(_sprite);
var _x = argument0;
var _y = argument1 + round((guiLineHeight - _height) * 0.5);
var _mouseOver = (PEd_guiShapeIsHovered(_delegate)
                  && guiMouseX > _x
                  && guiMouseY > _y
                  && guiMouseX < _x + _width
                  && guiMouseY < _y + _height);
draw_sprite_ext(_sprite, 0, _x, _y, 1, 1, 0, PEdColour.Input, 1);
if (_state)
{
    draw_sprite_ext(_sprite, 1, _x, _y, 1, 1, 0, PEdColour.Text, 1);
}
if (mouse_check_button_pressed(mb_left)
    && _mouseOver)
{
    return !_state;
}
return _state;
