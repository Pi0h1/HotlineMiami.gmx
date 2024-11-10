/// PEd_tileGetPosVec2(tile)
/**
 * @brief Gets the position of the tile as vec2.
 * @param {real} tile The id of the tile.
 * @return {vec2} The position of the tile.
 */
gml_pragma("forceinline");
return PEd_vec2(tile_get_x(argument0), tile_get_y(argument0));
