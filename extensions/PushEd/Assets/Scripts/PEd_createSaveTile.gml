/// PEd_createSaveTile(tile)
/**
 * @brief Stores the tile data into a ds_map.
 * @param {real} tile The id of the tile.
 * @return {real} The ds_map.
 */
var _saveTile = ds_map_create();
_saveTile[? "background" ] = background_get_name(tile_get_background(argument0));
_saveTile[? "left"] = tile_get_left(argument0);
_saveTile[? "top"] = tile_get_top(argument0);
_saveTile[? "width"] = tile_get_width(argument0);
_saveTile[? "height"] = tile_get_height(argument0);
_saveTile[? "x"] = tile_get_x(argument0);
_saveTile[? "y"] = tile_get_y(argument0);
_saveTile[? "depth"] = tile_get_depth(argument0);
_saveTile[? "scaleX"] = tile_get_xscale(argument0);
_saveTile[? "scaleY"] = tile_get_yscale(argument0);
_saveTile[? "colour"] = tile_get_blend(argument0);
_saveTile[? "alpha"] = tile_get_alpha(argument0);
_saveTile[? "visible"] = tile_get_visible(argument0);
return _saveTile;
