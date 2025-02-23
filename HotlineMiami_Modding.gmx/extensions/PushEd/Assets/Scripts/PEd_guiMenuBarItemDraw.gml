/// PEd_guiMenuBarItemDraw(menuBarItem)
/**
 * @brief Draws the menu bar item.
 * @param {real} menuBarItem The id of the menu bar item.
 */
var _item = argument0;
var _x = PEd_guiShapeGetX(_item);
var _y = PEd_guiShapeGetY(_item);
var _height = PEd_guiShapeGetHeight(_item);
var _name = _item[? "name"];
var _padding = 4;
var _width = PEd_guiShapeGetWidth(_item);
if (_width == 1)
{
    _width = string_width(_name) + _padding * 2;
    PEd_guiShapeSetWidth(_item, _width);
}

// Draw background
var _delegate = PEd_guiShapeGetDelegate(_item);
if (_delegate[? "current"] == _item[? "index"])
{
    PEd_guiDrawRectangle(_x, _y, _width, _height, PEdColour.Active, 1);
}
else if (PEd_guiShapeIsHovered(_item))
{
    PEd_guiDrawRectangle(_x, _y, _width, _height, PEdColour.Highlight, 1);
}

// Text
draw_text(_x + _padding, _y + round((_height - guiFontHeight) * 0.5), _name);
