/// PEd_guiDrawSpriteClickable(sprite, subimg, x, y, [colour])
/**
 * @brief Draws a clickable sprite at the given position.
 * @param {real} sprite   The id of the sprite.
 * @param {real} subimg   The subimage of the sprite.
 * @param {real} x        The x position to draw the sprite at.
 * @param {real} y        The y position to draw the sprite at.
 * @param {real} [colour] The colour to blend the sprite with.
 * @return {bool} True if the sprite is clicked.
 */
var _delegate = guiShapeFilling;
var _sprite = argument[0];
var _subimg = argument[1];
var _x = argument[2];
var _y = argument[3];
var _colour = c_white;
if (argument_count > 4)
{
    _colour = argument[4];
}
var _width = sprite_get_width(_sprite);
var _height = sprite_get_height(_sprite);
var _mouseOver = (PEd_guiShapeIsHovered(_delegate)
                  && guiMouseX > _x
                  && guiMouseY > _y
                  && guiMouseX < _x + _width
                  && guiMouseY < _y + _height);
draw_sprite_ext(_sprite, _subimg, _x, _y, 1, 1, 0, _colour, 1);
return (mouse_check_button_pressed(mb_left)
        && _mouseOver);
