/// PEd_xmlSetElementValue(element, value)
/**
 * @brief Sets value of the element to the given value.
 * @param {real}                  element The id of the element.
 * @param {real/string/undefined} value   The new element value.
 * @return {real} The id of the element.
 */
gml_pragma("forceinline");
argument0[? "value"] = argument1;
return argument0;
