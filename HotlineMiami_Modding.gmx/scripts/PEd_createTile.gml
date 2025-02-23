/// PEd_createTile(room, background, left, top, width, height, x, y, depth)
/**
 * @brief Creates a tile and adds it to the room.
 * @param {real} room       The id of the room.
 * @param {real} background The background asset from which the new tile will be extracted. 
 * @param {real} left       The x coordinate of the left of the new tile, relative to the background asset's top left corner. 
 * @param {real} top        The y coordinate of the top of the new tile, relative to the background assets top left corner. 
 * @param {real} width      The width of the tile. 
 * @param {real} height     The height of the tile. 
 * @param {real} x          The x position in the room to place the tile. 
 * @param {real} y          The y position in the room to place the tile. 
 * @param {real} depth      The depth at which to place the tile.
 * @return {real} The tile id.
 */
var _room = argument0;
var _id = tile_add(argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8);
var _tiles = PEd_roomGetTiles(_room);
ds_list_add(_tiles, _id);

// Register tile layer
with (PEd_oEditor)
{
    if (ds_list_find_index(tileLayers, argument8) == -1)
    {
        ds_list_add(tileLayers, argument8);
        ds_list_add(tileVisible, true);
    }
}

return _id;
