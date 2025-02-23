/// PEd_actClearSelection()
/**
 * @brief Selects no object.
 */
ds_list_clear(selectedObjects);
ds_list_clear(selectedObjectsData);
PEd_guiRequestRedrawAll(guiRoot)
