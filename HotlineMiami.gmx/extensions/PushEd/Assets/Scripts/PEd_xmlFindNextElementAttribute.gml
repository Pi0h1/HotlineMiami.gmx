/// PEd_xmlFindNextElementAttribute(element, attribute)
/**
 * @brief Finds next element attribute.
 * @param {real}   element   The id of the element.
 * @param {string} attribute Name of the current atribute.
 * @return {string/undefined} Name of the next attribute or undefined,
 *                            if the element does not have more attributes.
 */
gml_pragma("forceinline");
return ds_map_find_next(argument0[? "attributes"], argument1);
