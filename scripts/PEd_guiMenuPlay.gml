/// PEd_guiMenuPlay(contextMenu)
/**
 * @brief Adds options for the "Play" menu to the context menu.
 * @param {real} contextMenu The id of the context menu.
 */
var _contextMenu = argument0;
PEd_guiAddItem(_contextMenu,
    PEd_guiCreateContextMenuItem("Play", PEd_actPlayRoom, ksPlayRoom, "Play the room."));
