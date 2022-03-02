/// PEd_argbToColour(argb)
/**
 * @brief Converts ARGB colour to BGR colour.
 * @param {real} argb The ARGB colour.
 * @return {real} The BGR colour.
 */
gml_pragma("forceinline");
return PEd_rgbToBgr(argument0 & $FFFFFF);
