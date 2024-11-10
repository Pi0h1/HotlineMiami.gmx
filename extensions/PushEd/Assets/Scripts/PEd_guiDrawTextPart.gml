/// PEd_guiDrawTextPart(x, y, text, maxWidth[, colour])
/**
 * @brief Draws part of the text at the given position.
 * @param {real}   x        The x position to draw the text at.
 * @param {real}   y        The y position to draw the text at.
 * @param {string} text     The text to draw.
 * @param {real}   maxWidth The maximum width of the text in pixels. If the text
 *                          is longer than this, then it is clipped and
 *                          followed by "...".
 * @param {real}   [colour] The colour of the text. If not provided,
 *                          `PEdColour.Text` is used.
 */
var _colour;
if (argument_count > 4)
{
    _colour = argument[4];
}
else
{
    _colour = PEdColour.Text;
}
var _maxCharCount = floor(argument[3] / guiFontWidth);
if (string_length(argument[2]) > _maxCharCount)
{
    draw_text_colour(argument[0], argument[1],
        string_copy(argument[2], 1, _maxCharCount - 3)
        + string_repeat(".", min(3, _maxCharCount)),
        _colour, _colour, _colour, _colour, 1);
}
else
{
    draw_text_colour(argument[0], argument[1], argument[2],
        _colour, _colour, _colour, _colour, 1);
}
