/// PEd_guiMenuInput(contextMenu)
/**
 * @brief Adds options for an input menu to the context menu.
 * @param {real} contextMenu The id of the context menu.
 */
var _contextMenu = argument0;
PEd_guiAddItem(_contextMenu, PEd_guiCreateContextMenuItem("Cut", PEd_guiInputCut, ksInputCut));
PEd_guiAddItem(_contextMenu, PEd_guiCreateContextMenuItem("Copy", PEd_guiInputCopy, ksInputCopy));
PEd_guiAddItem(_contextMenu, PEd_guiCreateContextMenuItem("Paste", PEd_guiInputPaste, ksInputPaste));
PEd_guiAddItem(_contextMenu, PEd_guiCreateContextMenuItem("Delete", PEd_guiInputDelete, ksInputDelete));
PEd_guiAddItem(_contextMenu, PEd_guiCreateContextMenuItem("Select All", PEd_guiInputSelectAll, ksInputSelectAll));
