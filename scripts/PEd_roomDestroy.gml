/// PEd_roomDestroy(room)
/**
 * @brief Destroys the room and all instances and tiles that it contains.
 * @param {real} room The id of the room.
 */
var _room = argument0;
var _instances = PEd_roomGetInstances(_room);
var _tiles = PEd_roomGetTiles(_room);

for (var i = ds_list_size(_instances) - 1; i >= 0; i--)
{
    with (_instances[| i])
    {
        instance_destroy();
    }
}
ds_list_clear(_instances);

for (var i = ds_list_size(_tiles) - 1; i >= 0; i--)
{
    var _tile = _tiles[| i];
    if (tile_exists(_tile))
    {
        tile_delete(_tile);
    }
}
ds_list_clear(_tiles);

ds_map_destroy(_room);
