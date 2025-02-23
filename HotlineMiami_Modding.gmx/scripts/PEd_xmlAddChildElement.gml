/// PEd_xmlAddChildElement(element, child)
/**
 * @brief Adds child to the given element.
 * @param {real} element The id of the element to add the child to.
 * @param {real} child   The id of the child element.
 */
var _list = argument0[? "children"];
ds_list_add(_list, argument1);
ds_list_mark_as_map(_list, ds_list_size(_list) - 1);
argument1[? "parent"] = argument0;
