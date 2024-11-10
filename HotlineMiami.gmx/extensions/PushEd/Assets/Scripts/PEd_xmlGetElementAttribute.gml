/// PEd_xmlGetElementAttribute(element, attribute)
/**
 * @brief Gets value of the element attribute.
 * @param {real}   element   The id of the element.
 * @param {string} attribute The name of the attribute.
 * @return {real/string/undefiend} The attribute value.
 */
gml_pragma("forceinline");
return ds_map_find_value(argument0[? "attributes"], argument1);
