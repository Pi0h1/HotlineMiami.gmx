/// PEd_xmlGetChildElement(element, n)
/**
 * @brief Gets n-th child of the given element.
 * @param {real} element The id of the element.
 * @param {real} n       The index (0...numberOfChildren - 1) of the child element.
 * @return {real} The id of the n-th child of the given element.
 */
gml_pragma("forceinline");
return ds_list_find_value(argument0[? "children"], argument1);
