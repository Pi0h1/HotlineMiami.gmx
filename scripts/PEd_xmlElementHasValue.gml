/// PEd_xmlElementHasValue(element)
/**
 * @brief Finds out if the given element has a value.
 * @param {real} element The id of the element.
 * @return {boolean} True if the element has a value.
 */
gml_pragma("forceinline");
return ds_map_exists(argument0, "value");
