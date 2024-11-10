/// PEd_instanceSetPosY(id, val, [updatePivot])
/**
 * @brief Sets the y position of the instance.
 * @param {real} id            The id of the instance.
 * @param {real} val           The new y position of the instance. 
 * @param {bool} [updatePivot] If the instance is currently selected and this
 *                             is set to false, then the pivot will not be updated
 *                             to it's position (on the x axis). By default this is
 *                             set to true.
 */
with (argument[0])
{
    variable_instance_set(id, PEd_POS_Y, argument[1]);
    
    // Set pivot position
    var _offset = true;
    if (argument_count == 3)
    {
        _offset = argument[2];
    }
    
    var _selectedObj = PEd_oEditor.selectedObjects[| 0];
    if (is_undefined(_selectedObj))
    {
        _selectedObj = 0;
    }
    
    if (_offset
        && _selectedObj == id)
    {
        var _data = PEd_oEditor.selectedObjectsData[| 0];
        PEd_oPivot.y = argument[1] - _data[1];
    }
}
