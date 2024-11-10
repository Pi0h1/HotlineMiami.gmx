/// PEd_guiMenuBarUpdate(menuBar)
/**
 * @brief Updates the menu bar.
 * @param {real} menuBar The id of the menu bar.
 */
var _menu = argument0;
PEd_guiCompoundShapeUpdate(_menu);

if (_menu[? "current"] != noone
    && guiContextMenu == noone)
{
    _menu[? "current"] = noone;
    PEd_guiRequestRedraw(_menu);
}
