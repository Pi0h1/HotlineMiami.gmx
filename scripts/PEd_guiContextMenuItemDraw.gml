/// PEd_guiContextMenuItemDraw(contextMenuItem)
/**
 * @brief Dras the context menu item.
 * @param {real} contextMenuItem The id of the context menu item.
 */
var _item = argument0;
var _x = PEd_guiShapeGetX(_item);
var _y = PEd_guiShapeGetY(_item);
var _width = PEd_guiShapeGetWidth(_item);
var _height = PEd_guiShapeGetHeight(_item);
var _name = _item[? "name"];
var _delegate = PEd_guiShapeGetDelegate(_item);
var _scrAction = _item[? "scrAction"];
var _textColour = PEdColour.Disabled;
var _delegateWidth = PEd_guiShapeGetWidth(_delegate);

var _shortcut = _item[? "shortcut"];
var _shortcutWidth = 0;

// Draw highlight  
if (_scrAction != noone)
{
    _textColour = PEdColour.Text;
    if (PEd_guiShapeIsHovered(_item))
    {
        PEd_guiDrawRectangle(_x, _y, _delegateWidth, _height, PEdColour.Active, 1);
    }
}

// Draw item name
draw_text_colour(_x + 8, _y + round((_height - guiFontHeight) * 0.5), _name,
                 _textColour, _textColour, _textColour, _textColour, 1);

// Draw keyboard shortcut
if (_shortcut != noone)
{
    var _shortcutText = PEd_guiKeyboardShortcutToString(_shortcut);
    _shortcutWidth = string_width(_shortcutText) + 8;
    draw_text_colour(_x + _delegateWidth - _shortcutWidth,
                     _y + round((_height - guiFontHeight) * 0.5),
                     _shortcutText,
                     _textColour, _textColour, _textColour, _textColour, 1);
    _shortcutWidth += guiFontWidth * 2;
}

PEd_guiShapeSetWidth(_item, max(_x + string_width(_name) + _shortcutWidth, _delegateWidth));
