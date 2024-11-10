/// PEd_guiDrawListItemEye(name, x, y, active, disabled, [highlighted])
/**
 * @brief Draws a list item with an eye on the given position.
 * @param {string} name          The item name.
 * @param {real}   x             The x position to draw the item at.
 * @param {real}   y             The y position to draw the item at.
 * @param {bool}   active        True if the item is currently selected.
 * @param {bool}   disabled      True to disable clicking on the item.
 * @param {bool}   [highlighted] True to highlight the item.
 * @return {real} If the item is clicked, then 1 is returned.
 *                If the eye is clicked, then 2 is returned.
 *                In all other cases returns 0.
 */
var _container = guiShapeFilling;
var _containerWidth = PEd_guiShapeGetWidth(_container);
var _text = string(argument[0]);
var _x = argument[1];
var _y = argument[2];
var _active = argument[3];
var _disabled = argument[4];
var _highlight = false;
if (argument_count > 5)
{
    _highlight = argument[5];
}

// Check mouse over
var _mouseOver = (PEd_guiShapeIsHovered(_container)
                  && guiMouseY > _y
                  && guiMouseY < _y + guiLineHeight);

// Draw
PEd_guiDrawListItem(_text, _x + guiLineHeight, _y, _active, _disabled, _highlight);
draw_sprite_ext(PEd_guiSprMisc, 1, _x, _y, 1, 1, 0, merge_colour(c_white, PEdColour.Disabled, _disabled), 1);

// Click
if (mouse_check_button_pressed(mb_left)
    && _mouseOver) 
{
    if (guiMouseX < _x + guiLineHeight)
    {
        return 2;
    }
    if (!_disabled)
    {
        return 1;
    }
}
return 0;
