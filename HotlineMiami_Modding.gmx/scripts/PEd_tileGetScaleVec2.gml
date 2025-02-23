/// PEd_tileGetScaleVec2(tile)
/**
 * @brief Gets the scale of the tile as vec2.
 * @param {real} tile The id of the tile.
 * @return {vec2} The scale of the tile.
 */
gml_pragma("forceinline");
return PEd_vec2(tile_get_xscale(argument0), tile_get_yscale(argument0));
