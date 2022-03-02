/// PEd_actHideSelectedObjects()
/**
 * @brief Hides selected objects and clears selection.
 */
switch (editMode)
{
    case PEdEditModes.Object:
        for (var i = ds_list_size(selectedObjects) - 1; i >= 0; i--)
        {
            selectedObjects[| i].visible = false;
        }
        break;
        
    case PEdEditModes.Tile:
        for (var i = ds_list_size(selectedObjects) - 1; i >= 0; i--)
        {
            tile_set_visible(selectedObjects[| i], false);
        }
        break;
}
PEd_actClearSelection();
