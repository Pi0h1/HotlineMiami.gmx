/// PEd_xmlDestroyElement(element)
/**
 * @brief Destroys the element and all its children.
 * @param {real} element The id of the element to be destroyed.
 */
var _element = argument0;
var _parent = _element[? "parent"];

if (_parent != noone)
{
    var _index = ds_list_find_index(_parent[? "children"], _element);
    if (_index >= 0)
    {
        ds_list_delete(_parent[? "children"], _index);
    }
}

ds_map_destroy(_element);
