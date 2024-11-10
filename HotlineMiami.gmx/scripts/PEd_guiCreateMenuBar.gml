/// PEd_guiCreateMenuBar()
/**
 * @brief Creates a new menu bar.
 * @return {real} The id of the created menu bar.
 */
var _menu = PEd_guiCreateCanvas(PEdGUIShape.MenuBar);
PEd_guiShapeSetHeight(_menu, guiLineHeight);
_menu[? "scrUpdate"] = PEd_guiMenuBarUpdate;
_menu[? "scrDraw"] = PEd_guiMenuBarDraw;
_menu[? "current"] = noone;
return _menu;
