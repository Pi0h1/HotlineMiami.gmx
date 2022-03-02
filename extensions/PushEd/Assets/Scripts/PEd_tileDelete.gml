/// PEd_tileDelete(tile)
/**
 * @brief Delets the tile and removes it from the room that it is in.
 * @param {real} tile The id of the tile.
 */
for (var i = ds_list_size(pedRoomList) - 1; i >= 0; i--)
{
    var _tiles = PEd_roomGetTiles(pedRoomList[| i]);
    var _pos = ds_list_find_index(_tiles, argument0);
    if (_pos != -1)
    {
        ds_list_delete(_tiles, _pos);
        break;
    }
}
if (tile_exists(argument0))
{
    tile_delete(argument0);
}
