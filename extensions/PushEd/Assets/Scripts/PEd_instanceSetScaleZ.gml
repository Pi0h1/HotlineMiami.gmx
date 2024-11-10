/// PEd_instanceSetScaleZ(id, val)
/**
 * @brief Sets the instance scale on the z axis.
 * @param {real} id  The id of the instance.
 * @param {real} val The new scale on the z axis.
 * @note If the instance is currently selected, this z scale
 *       is set to all instances in multiple selection.
 */
with (argument0)
{
    variable_instance_set(id, PEd_SCALE_Z, argument1);
    
    with (PEd_oEditor)
    {
        if (PEd_getSelectedObject() == argument0)
        {
            for (var i = ds_list_size(selectedObjects) - 1; i > 0; i--) 
            {
                with (selectedObjects[| i])
                {
                    variable_instance_set(id, PEd_SCALE_Z, argument1);
                }
            }
        }
    }
}
