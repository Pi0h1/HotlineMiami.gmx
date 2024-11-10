/// PEd_xmlGetNumberOfChildElements(element)
/**
 * @brief Gets number of children of the given element.
 * @param {real} element The id of the element.
 * @return {real} Number of children of the given element.
 */
gml_pragma("forceinline");
return ds_list_size(argument0[? "children"]);
