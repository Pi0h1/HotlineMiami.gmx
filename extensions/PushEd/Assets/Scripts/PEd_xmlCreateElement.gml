/// PEd_xmlCreateElement([name])
/**
 * @brief Creates a new element.
 * @param {string} name The name of the element.
 * @return {real} The id of the created element.
 */
var _element = ds_map_create();
ds_map_add_map(_element, "attributes", ds_map_create());
ds_map_add_list(_element, "children", ds_list_create());
_element[? "parent"] = noone;

if (argument_count == 1)
{
    _element[? "name"] = string(argument[0]);
}
else
{
    _element[? "name"] = "";
}

return _element;
