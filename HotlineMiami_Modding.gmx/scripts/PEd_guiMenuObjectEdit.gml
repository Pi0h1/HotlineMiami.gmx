/// PEd_guiMenuObjectEdit(contextMenu)
/**
 * @brief Adds options for the object "Edit" menu to the context menu.
 * @param {real} contextMenu The id of the context menu.
 */
var _contextMenu = argument0;
PEd_guiAddItem(_contextMenu,
    PEd_guiCreateContextMenuItem("Clear Selection", PEd_actClearSelection, ksClearSelection, "Removes all selected objects from selection."));
PEd_guiAddItem(_contextMenu,
    PEd_guiCreateContextMenuItem("Copy", PEd_actCopySelectedObjects, ksCopyObjects, "Duplicate selected objects."));
PEd_guiAddItem(_contextMenu,
    PEd_guiCreateContextMenuItem("Delete", PEd_actDestroySelectedObjects, ksDestroyObjects, "Delete selected objects."));
PEd_guiAddItem(_contextMenu,
    PEd_guiCreateContextMenuItem("Hide", PEd_actHideSelectedObjects, noone, "Hide selected objects."));
