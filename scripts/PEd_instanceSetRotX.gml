/// PEd_instanceSetRotX(id, val)
/**
 * @brief Sets the instance rotation on the x axis.
 * @param {real} id  The id of the instance.
 * @param {real} val The new rotation angle around the x axis.
 * @note If the instance is currently selected, this x rotation
 *       is set to all instances in multiple selection.
 */
with (argument0)
{
    variable_instance_set(id, PEd_ROT_X, argument1);
    
    with (PEd_oEditor)
    {
        if (PEd_getSelectedObject() == argument0)
        {
            for (var i = ds_list_size(selectedObjects) - 1; i > 0; i--) 
            {
                with (selectedObjects[| i])
                {
                    variable_instance_set(id, PEd_ROT_X, argument1);
                }
            }
        }
    }
}
