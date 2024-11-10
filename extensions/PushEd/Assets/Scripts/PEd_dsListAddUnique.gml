/// PEd_dsListAddUnique(list, value)
/**
 * @brief If the value is not in the list, it is added to it.
 * @param {real} list  The id of the list.
 * @param {any}  value The value to be added.
 * @return {real} The index on which has been the value found or -1.
 */
var _pos = ds_list_find_index(argument0, argument1);
if (_pos == -1)
{
    ds_list_add(argument0, argument1);
} 
return _pos;
