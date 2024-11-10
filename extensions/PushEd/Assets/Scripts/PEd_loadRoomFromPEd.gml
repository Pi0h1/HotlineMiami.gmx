/// PEd_loadRoomFromPEd(file)
/**
 * @brief Loads a room from the external *.ped file.
 * @param {string} file The name of the file to load from.
 * @return {real} The id of the room or noone on fail.
 */
var _path = argument0;
 
////////////////////////////////////////////////////////////////////////////////
//
// Read source
//
var _source = "";
var _file = file_text_open_read(_path);
if (_file != -1) 
{
    do 
    {
        _source += file_text_read_string(_file);
        file_text_readln(_file);
    }
    until (file_text_eof(_file));
    file_text_close(_file);
}
else 
{
    return noone;
}

////////////////////////////////////////////////////////////////////////////////
//
// Load room
//
var _room = json_decode(_source);
if (_room == -1)
{
    return noone;
}

////////////////////////////////////////////////////////////////////////////////
// Load camera and editor settings
global.pedUsing3D = _room[? "using3D"];
PEd_oEditor.editMode = _room[? "editMode"];
PEd_oEditor.editTool = _room[? "editTool"];
PEd_oEditor.editFloor = _room[? "editFloor"];
PEd_oEditor.x = _room[? "cameraX"];
PEd_oEditor.y = _room[? "cameraY"];
PEd_oEditor.z = _room[? "cameraZ"];
PEd_oEditor.direction = _room[? "cameraDir"];
PEd_oEditor.camPitch = _room[? "cameraPitch"];
view_xview[0] = _room[? "viewX"];
view_yview[0] = _room[? "viewY"];
PEd_oEditor.viewZoom = _room[? "viewZoom"];
PEd_oPivot.x = _room[? "pivotX"];
PEd_oPivot.y = _room[? "pivotY"];
PEd_oPivot.z = _room[? "pivotZ"];

PEd_oEditor.viewLastX = view_xview[0];
PEd_oEditor.viewLastY = view_xview[0];

if (global.pedUsing3D)
{
    PEd_start3D();
}
else
{
    PEd_end3D();
}

// TODO: Following could be put into a separate script, which would just take
// list as parameter.

////////////////////////////////////////////////////////////////////////////////
// Load instances
var _instances = PEd_roomGetInstances(_room);
var _numberOfInstances = ds_list_size(_instances);

for (var i = 0; i < _numberOfInstances; _numberOfInstances--)
{
    var _inst = _instances[| i];    
    var _id = PEd_instanceCreate(_room,
                                 _inst[? "x"],
                                 _inst[? "y"],
                                 asset_get_index(_inst[? "object"]));
    PEd_instanceSetName(_id, _inst[? "name"]);
    var _code = _inst[? "code"];
    PEd_instanceSetCode(_id, _code);
    PEd_instanceSetScaleX(_id, _inst[? "scaleX"]);
    PEd_instanceSetScaleY(_id, _inst[? "scaleY"]);
    PEd_instanceSetRotZ(_id, _inst[? "rotation"]);
    PEd_instanceSetColour(_id, _inst[? "colour"]);
    PEd_instanceSetAlpha(_id, _inst[? "alpha"]);
    
    if (!is_undefined(_inst[? "visible"]))
    {
        _id.visible = _inst[? "visible"];
    }
    
    with (_id) 
    {
        PEd_codeProcess(_code);
    }
    
    ds_list_delete(_instances, i);
}

////////////////////////////////////////////////////////////////////////////////
// Load tiles
var _tiles = PEd_roomGetTiles(_room);
var _numberOfTiles = ds_list_size(_tiles);

for (var i = 0; i < _numberOfTiles; _numberOfTiles--)
{
    var _t = _tiles[| i]; 
    var _id = PEd_createTile(_room,
                        asset_get_index(_t[? "background"]),
                       _t[? "left"],
                       _t[? "top"],
                       _t[? "width"],
                       _t[? "height"],
                       _t[? "x"],
                       _t[? "y"],
                       _t[? "depth"]);
    tile_set_scale(_id,
                   _t[? "scaleX"],
                   _t[? "scaleY"]);
    tile_set_blend(_id, _t[? "colour"]);
    tile_set_alpha(_id, _t[? "alpha"]);
    
    if (!is_undefined(_t[? "visible"]))
    {
        tile_set_visible(_id, _t[? "visible"]);
    }
    
    ds_list_delete(_tiles, i);
}

return _room;
