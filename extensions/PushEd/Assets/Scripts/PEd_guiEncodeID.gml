/// PEd_guiEncodeID(delegate, number)
/**
 * @brief Gets the id of the dynamic shape.
 * @param {real} delegate The id of the delegate.
 * @param {real} number   The unique number of the dynamic shape.
 * @return {real} The id of the dynamic shape.
 */
gml_pragma("forceinline");
return ((argument0 + 1) * 100000 + argument1);
