/// PEd_rgbToBgr(colour)
/**
 * @brief Converts between RGB and BGR colour format.
 * @param {real} colour The BGR or RGB colour.
 * @return {real} The resulting colour.
 */
gml_pragma("forceinline");
return ((argument0 & $FF0000) >> 16) | (argument0 & $FF00) | ((argument0 & $FF) << 16);
