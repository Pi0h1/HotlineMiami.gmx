/// PEd_deselectObject(id)
/**
 * @brief Removes object from selection.
 * @param {real} id The id of the instance or tile to remove from selection.
 * @param {bool} True if the object was removed from selection.
 */
var _pos = ds_list_find_index(PEd_oEditor.selectedObjects, argument0);
if (_pos >= 0)
{
    ds_list_delete(PEd_oEditor.selectedObjects, _pos);
    ds_list_delete(PEd_oEditor.selectedObjectsData, _pos);
    PEd_savePivotOffsets();
    return true;
}
return false;
