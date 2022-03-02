/// PEd_objectListGetItem(ind)
/**
 * @brief Gets the object on given index in the list of objects.
 * @param {real} ind The index.
 * @return {real} The object on given index in the list of objects.
 */
var i = ds_list_find_value(PEd_oEditor.pedObjectList, argument0);
if (is_undefined(i)) 
{
    return -1;
}
return i;
