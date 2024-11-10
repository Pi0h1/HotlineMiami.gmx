/// PEd_guiCreateContextMenu()
/**
 * @brief Creates a new context menu.
 * @return {real} The id of the created menu.
 */
var _menu = PEd_guiCreateContainer(PEdGUIShape.ContextMenu);
_menu[? "scrUpdate"] = PEd_guiContextMenuUpdate;
_menu[? "scrDraw"] = PEd_guiContextMenuDraw;
PEd_guiShapeSetDepth(_menu, 2147483647);
return _menu;
