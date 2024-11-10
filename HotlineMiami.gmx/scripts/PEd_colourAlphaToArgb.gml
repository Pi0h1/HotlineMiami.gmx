/// PEd_colourAlphaToArgb(colour, alpha)
/**
 * @brief Converts the colour and aplha into a ARGB colour.
 * @param {real} colour The colour.
 * @param {real} alpha The alpha.
 * @return {real} The ARGB colour.
 */
gml_pragma("forceinline");
return PEd_rgbToBgr(argument0) | ((argument1 * 255) << 24);
