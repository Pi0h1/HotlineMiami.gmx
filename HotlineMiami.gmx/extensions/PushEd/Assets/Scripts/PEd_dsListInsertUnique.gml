/// PEd_dsListInsertUnique(list, value, position)
/**
 * @brief If the value is not in the list, it is inserted to it at given position.
 * @param {real} list     The id of the list.
 * @param {any}  value    The value to be added.
 * @param {real} position The index to insert the value at.
 * @return {real} The index on which has been the value found or -1.
 */
var _pos = ds_list_find_index(argument0, argument1);
if (_pos == -1)
{
    ds_list_insert(argument0, argument2, argument1);
} 
return _pos;
