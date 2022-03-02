/// PEd_roomCopy(room)
/**
 * @brief Creates a copy of the room
 * @param {real} room The id of the room.
 * @return {real} The copy of the room.
 */
var _room = argument0;
var _copy = ds_map_create();

// TODO: Oh 4 fcks sake...
_copy[? "name"] = _room[? "name"];
_copy[? "caption"] = _room[? "caption"];
_copy[? "width"] = _room[? "width"];
_copy[? "height"] = _room[? "height"];
_copy[? "hsnap"] = _room[? "hsnap"];
_copy[? "vsnap"] = _room[? "vsnap"];
_copy[? "dsnap"] = _room[? "dsnap"];
_copy[? "speed"] = _room[? "speed"];
_copy[? "persistent"] = _room[? "persistent"];
_copy[? "colour"] = _room[? "colour"];
_copy[? "code"] = _room[? "code"];
_copy[? "grid"] = _room[? "grid"];
_copy[? "showColour"] = _room[? "showColour"];

var _physicsWorld = ds_map_create();
ds_map_copy(_physicsWorld, PEd_roomGetPhysicsWorld(_room));
ds_map_add_map(_copy, "physicsWorld", _physicsWorld);

var _backgrounds = ds_list_create();
var _viewports = ds_list_create();
var _instances = ds_list_create();
var _tiles = ds_list_create();

for (var i = 0; i < 8; i++)
{
    // TODO: Create scripts for copying backgrounds, viewports, ...
    var _background = ds_map_create();
    ds_map_copy(_background, PEd_roomGetBackground(_room, i));
    PEd_dsListAddMap(_backgrounds, _background);
    
    var _viewport = ds_map_create();
    ds_map_copy(_viewport, PEd_roomGetViewport(_room, i));
    PEd_dsListAddMap(_viewports, _viewport);
}

ds_list_copy(_instances, PEd_roomGetInstances(_room));
ds_list_copy(_tiles, PEd_roomGetTiles(_room));

ds_map_add_list(_copy, "backgrounds", _backgrounds);
ds_map_add_list(_copy, "viewports", _viewports);
ds_map_add_list(_copy, "instances", _instances);
ds_map_add_list(_copy, "tiles", _tiles);

return _copy;
