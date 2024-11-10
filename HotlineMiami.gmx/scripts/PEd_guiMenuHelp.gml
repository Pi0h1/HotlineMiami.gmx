/// PEd_guiMenuHelp(contextMenu)
/**
 * @brief Adds options for the "Help" menu to the context menu.
 * @param {real} contextMenu The id of the context menu.
 */
var _contextMenu = argument0;
PEd_guiAddItem(_contextMenu,
    PEd_guiCreateContextMenuItem("About PushEd...", PEd_actShowInfo));
