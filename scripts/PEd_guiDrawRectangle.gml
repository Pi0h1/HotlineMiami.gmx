/// PEd_guiDrawRectangle(x, y, width, height, colour, [alpha])
/**
 * @brief Draws a rectangle of the given size and colour at the given position.
 * @param {real} x       The x position to draw the rectangle at.
 * @param {real} y       The y position to draw the rectangle at.
 * @param {real} width   The width of the rectangle.
 * @param {real} height  The height of the rectangle.
 * @param {real} colour  The colour of the rectangle.
 * @param {real} [alpha] The alpha of the rectangle.
 */
var _alpha = 1;
if (argument_count > 5)
{
    _alpha = argument[5];
}
draw_sprite_ext(PEd_guiSprRectangle, 0,
                argument[0], argument[1],
                argument[2], argument[3],
                0, argument[4], _alpha);
