/// PEd_createRoom(name, width, height)
/**
 * @brief Creates a new room.
 * @param {string} name   The name of the room.
 * @param {real}   width  The width of the room.
 * @param {real}   height The height of the room.
 * @return {real} room The id of the room.
 */
var _room = ds_map_create();
_room[? "name"] = argument[0];
_room[? "caption"] = "";
_room[? "width"] = argument[1];
_room[? "height"] = argument[2];
_room[? "hsnap"] = 1;
_room[? "vsnap"] = 1;
_room[? "dsnap"] = 1;
_room[? "speed"] = 60;
_room[? "persistent"] = false;
_room[? "colour"] = 0;
_room[? "code"] = "";
_room[? "grid"] = true;
_room[? "showColour"] = true;

var _views = ds_list_create();
var _backgrounds = ds_list_create();
for (var i = 0; i < 8; i++)
{
    var _view = PEd_createViewport((i == 0), 0, 0, 640, 480, 32, 32, -1, -1, noone);
    var _background = PEd_createBackground();
    PEd_dsListAddMap(_views, _view);
    PEd_dsListAddMap(_backgrounds, _background);
}
ds_map_add_list(_room, "viewports", _views);
ds_map_add_list(_room, "backgrounds", _backgrounds);
var _physicsWorld = PEd_createPhysicsWorld(false, 0, 0, argument[1], argument[2], 0, 10, 0.1);
ds_map_add_map(_room, "physicsWorld", _physicsWorld);

var _instances = ds_list_create();
ds_map_add_list(_room, "instances", _instances);

var _tiles = ds_list_create();
ds_map_add_list(_room, "tiles", _tiles);

return _room;
