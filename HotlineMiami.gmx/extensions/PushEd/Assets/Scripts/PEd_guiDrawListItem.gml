/// PEd_guiDrawListItem(name, x, y, active, disabled, [highlighted])
/**
 * @brief Draws a list item on the given position.
 * @param {string} name          The item name.
 * @param {real}   x             The x position to draw the item at.
 * @param {real}   y             The y position to draw the item at.
 * @param {bool}   active        True if the item is currently selected.
 * @param {bool}   disabled      True to disable clicking on the item.
 * @param {bool}   [highlighted] True to highlight the item.
 * @return {real} If the item is clicked, then 1 is returned.
 *                If the mouse cursor is currently over the item, then -1 is returned.
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
var _textColour = PEdColour.Text;
var _backgroundColour = noone;

if (_active)
{
    _textColour = PEdColour.TextSelected;
    _backgroundColour = PEdColour.Active;
}
else if (!_disabled) 
{
    if (_highlight
        || _mouseOver)
    {
        _backgroundColour = PEdColour.Highlight;
    }
}
else 
{
    _textColour = PEdColour.Disabled;
}

if (_backgroundColour != noone)
{
    PEd_guiDrawRectangle(0, _y, _containerWidth, guiLineHeight, _backgroundColour);
}
if (_textColour != PEdColour.Text)
{
    draw_text_colour(_x, _y + round((guiLineHeight - guiFontHeight) * 0.5), _text,
                     _textColour, _textColour, _textColour, _textColour, 1);
}
else
{
    draw_text(_x, _y + round((guiLineHeight - guiFontHeight) * 0.5), _text);
}

// Click
if (!_disabled
    && _mouseOver)
{
    if (mouse_check_button_pressed(mb_left))
    {
        return 1;
    }
    return -1;
}
return 0;
