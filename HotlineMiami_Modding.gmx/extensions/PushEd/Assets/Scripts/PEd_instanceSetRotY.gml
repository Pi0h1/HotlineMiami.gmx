/// PEd_instanceSetRotY(id, val)
/**
 * @brief Sets the instance rotation on the y axis.
 * @param {real} id  The id of the instance.
 * @param {real} val The new rotation angle around the y axis.
 * @note If the instance is currently selected, this y rotation
 *       is set to all instances in multiple selection.
 */
with (argument0)
{
    variable_instance_set(id, PEd_ROT_Y, argument1);
    
    with (PEd_oEditor)
    {
        if (PEd_getSelectedObject() == argument0)
        {
            for (var i = ds_list_size(selectedObjects) - 1; i > 0; i--) 
            {
                with (selectedObjects[| i])
                {
                    variable_instance_set(id, PEd_ROT_Y, argument1);
                }
            }
        }
    }
}
