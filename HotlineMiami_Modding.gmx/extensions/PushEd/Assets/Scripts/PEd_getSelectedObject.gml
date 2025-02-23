/// PEd_getSelectedObject()
/**
 * @brief Gets the id of currently selected object.
 * @return {real} The id of currently selected object or 0.
 *                If the id is less than 0, then a room is selected.
 */
var _selectedObj = PEd_oEditor.selectedObjects[| 0];
if (is_undefined(_selectedObj))
    _selectedObj = 0;
return _selectedObj;
