/// PEd_guiMenuFile(contextMenu)
/**
 * @brief Adds options for the "File" menu to the context menu.
 * @param {real} contextMenu The id of the context menu.
 */
var _contextMenu = argument0;
PEd_guiAddItem(_contextMenu,
    PEd_guiCreateContextMenuItem("New", PEd_actCreateEmptyRoom, ksNewRoom));
PEd_guiAddItem(_contextMenu,
    PEd_guiCreateContextMenuItem("Open", PEd_actOpenRoom, ksOpenRoom));
PEd_guiAddItem(_contextMenu,
    PEd_guiCreateContextMenuItem("Import", PEd_actImportRoom, ksImportRoom));
PEd_guiAddItem(_contextMenu,
    PEd_guiCreateContextMenuItem("Save", PEd_actSaveRoom, ksSaveRoom));
PEd_guiAddItem(_contextMenu,
    PEd_guiCreateContextMenuItem("Save As", PEd_actSaveRoomAs, ksSaveRoomAs));
PEd_guiAddItem(_contextMenu,
    PEd_guiCreateContextMenuItem("Export", PEd_actExportRoom, ksExportRoom));
PEd_guiAddItem(_contextMenu,
    PEd_guiCreateContextMenuItem("Exit", PEd_actExit));
