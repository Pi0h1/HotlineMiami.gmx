/// PEd_tileGetColourARGB(tile)
/**
 * @brief Gets the ARGB colour of the tile.
 * @param {real} tile The id of the tile.
 * @return {real} The ARGB colour of the tile.
 */
gml_pragma("forceinline");
return PEd_colourAlphaToArgb(tile_get_blend(argument0),
                             tile_get_alpha(argument0));
