/// PEd_argbToAlpha(argb)
/**
 * @brief Converts ARGB colour to alpha.
 * @param {real} argb The ARGB colour.
 * @return {real} The alpha.
 */
gml_pragma("forceinline");
return (((argument0 & $FF000000) >> 24) / 255);
