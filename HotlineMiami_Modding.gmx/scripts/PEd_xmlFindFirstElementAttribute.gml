/// PEd_xmlFindFirstElementAttribute(element)
/** 
 * @brief Finds the first attribute of the given element.
 * @param {real} element The id of the element.
 * @return {string/undefiend} The name of the first attribute or undefined,
 *                            if the element does not have any.
 */
gml_pragma("forceinline");
return ds_map_find_first(argument0[? "attributes"]);
