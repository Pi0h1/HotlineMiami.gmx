/// PEd_guiCreateMenuBarItem(name, scrContextMenu)
/**
 * @brief Creates a new menu bar item.
 * @param {string} name           The name of the item.
 * @param {real}   scrContextMenu The script that opens a context menu for this item or noone.
 * @return {real} The id of the created menu bar item.
 */
var _item = PEd_guiCreateShape(PEdGUIShape.MenuBarItem);
_item[? "name"] = argument0;
_item[? "scrContextMenu"] = argument1;
_item[? "scrUpdate"] = PEd_guiMenuBarItemUpdate;
_item[? "scrDraw"] = PEd_guiMenuBarItemDraw;
_item[? "index"] = noone;
PEd_guiShapeSetHeight(_item, guiLineHeight);
return _item;
