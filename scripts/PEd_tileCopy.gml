/// PEd_tileCopy(room, tile)
/**
 * @brief Creates a copy of the tile and adds it to the room.
 * @param {real} toom The id of the room to add the tile to.
 * @param {real} tile The id of the tile.
 * @return {real} The created copy.
 */
var _t = PEd_createTile(argument0,
                        tile_get_background(argument1),
                        tile_get_left(argument1),
                        tile_get_top(argument1),
                        tile_get_width(argument1),
                        tile_get_height(argument1),
                        tile_get_x(argument1),
                        tile_get_y(argument1),
                        tile_get_depth(argument1));
tile_set_blend(_t, tile_get_blend(argument1));
tile_set_alpha(_t, tile_get_alpha(argument1));
tile_set_scale(_t, tile_get_xscale(argument1),
                   tile_get_yscale(argument1));
return _t;
