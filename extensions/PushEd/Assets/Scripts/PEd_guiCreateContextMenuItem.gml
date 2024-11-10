/// PEd_guiCreateContextMenuItem(name, action, [shortcut], [tooltip])
/**
 * @brief Creates a new context menu item with given name.
 * @param {string} name       The of the context menu item.
 * @param {real}   action     The script that will be executed on click, or noone.
 * @param {real}   [shortcut] The id of the keyboard shortcut for this item.
 * @param {string} [tooltip]  The tooltip text that will show up on mouse over.
 *                           If you don't specify the action then this is not used.
 * @return {real} The id of the created context menu item.
 */
var _item = PEd_guiCreateShape(PEdGUIShape.ContextMenuItem);
_item[? "name"] = argument[0];
_item[? "scrAction"] = argument[1];
_item[? "scrUpdate"] = PEd_guiContextMenuItemUpdate;
_item[? "scrDraw"] = PEd_guiContextMenuItemDraw;
PEd_guiShapeSetHeight(_item, guiLineHeight);
_item[? "shortcut"] = noone;
if (argument_count > 2)
{
    _item[? "shortcut"] = argument[2];
}
if (argument_count > 3
    && _item[? "scrAction"] != noone)
{
    PEd_guiShapeSetTooltip(_item, argument[3]);
}
return _item;
