/// PEd_instanceSetAlpha(id, val)
/**
 * @brief Sets the instance alpha.
 * @param {real} id  The id of the instance.
 * @param {real} val The new alpha. 
 */
with (argument0)
{
    variable_instance_set(id, PEd_ALPHA, argument1);
    
    with (PEd_oEditor)
    {
        if (PEd_getSelectedObject() == argument0)
        {
            for (var i = ds_list_size(selectedObjects) - 1; i > 0; i--) 
            {
                with (selectedObjects[| i])
                {
                    variable_instance_set(id, PEd_ALPHA, argument1);
                }
            }
        }
    }
}
