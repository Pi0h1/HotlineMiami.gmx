/// PEd_guiDrawTooltip(x, y, text)
/**
 * @brief Dras a tooltip at the given position.
 * @param {real}   x    The x position to draw the tooltip at.
 * @param {real}   y    The y position to draw the tooltip at.
 * @param {string} text The text of the tooltip.
 */
var _x = argument0;
var _y = argument1;
var _text = argument2;
var _width = string_width(_text) + 16;
var _height = string_height(_text) + 8;

_x = min(_x, window_get_width() - _width - 1);
_y = min(_y, window_get_height() - _height - 1);
    
PEd_guiDrawRectangle(_x, _y, _width, _height, PEdColour.WindowBorder);
PEd_guiDrawRectangle(_x + 1, _y + 1, _width - 2, _height - 2, PEdColour.WindowBackground);
draw_text(_x + 8, _y + 4, _text);
