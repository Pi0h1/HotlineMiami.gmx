/// PEd_actDestroySelectedObjects()
/**
 * @brief Destroys all selected objects.
 */
if (PEd_getSelectedObject() <= 0)
    exit;
 
switch (editMode)
{
    case PEdEditModes.Object:
        for (var i = ds_list_size(selectedObjects) - 1; i >= 0; i--) 
            PEd_instanceDestroy(selectedObjects[| i]);
        break;
        
    case PEdEditModes.Tile:
        for (var i = ds_list_size(selectedObjects) - 1; i >= 0; i--) 
            PEd_tileDelete(selectedObjects[| i]);
        break;
}
PEd_actClearSelection();
