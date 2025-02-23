/// PEd_xmlRemoveElementAttribute(element, attribute)
/**
 * @brief Removes given attribute from the element.
 * @param {real}   element   The id of the element.
 * @param {string} attribute The name of the attribute.
 */
var _attributes = argument0[? "attributes"];
if (ds_map_exists(_attributes, argument1))
{
    ds_map_delete(_attributes, argument1);
}
