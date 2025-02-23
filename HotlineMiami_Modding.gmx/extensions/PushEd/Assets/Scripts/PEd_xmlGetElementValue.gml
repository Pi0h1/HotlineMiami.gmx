/// PEd_xmlGetElementValue(element)
/**
 * @brief Gets the value of the given element.
 * @param {real} element The id of the element.
 * @return {real/string/undefined} The element value or undefined,
 *                                 if the element does not have any value.
 */
gml_pragma("forceinline");
return argument0[? "value"];
