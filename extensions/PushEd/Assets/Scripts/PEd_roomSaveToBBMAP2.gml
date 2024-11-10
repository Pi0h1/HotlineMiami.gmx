/// PEd_roomSaveToBBMAP2(room, file)
/**
 * @brief Saves the room into the *.bbmap version 2 file.
 * @param {real}   room The id of the room.
 * @param {string} file The name of the file to export to.
 * @return {bool} True on success.
 */
var _room = argument0;
var _path = argument1;
var _roomName = string_replace(filename_name(_path), ".bbmap", "");
PEd_roomSetName(_room, _roomName);

////////////////////////////////////////////////////////////////////////////////
//
// Create buffer
//
var _buffer = buffer_create(1024, buffer_grow, 1); // TODO: Calculate buffer size
buffer_seek(_buffer, buffer_seek_start, 0);

// Write bbmap version
buffer_write(_buffer, buffer_u8, 2);

////////////////////////////////////////////////////////////////////////////////
// Write room data
buffer_write(_buffer, buffer_u32, PEd_roomGetWidth(_room));
buffer_write(_buffer, buffer_u32, PEd_roomGetHeight(_room));
buffer_write(_buffer, buffer_u32, PEd_roomGetSpeed(_room));
buffer_write(_buffer, buffer_u32, PEd_roomGetColour(_room));
buffer_write(_buffer, buffer_bool, PEd_roomGetShowColour(_room));
buffer_write(_buffer, buffer_bool, PEd_roomGetPersistent(_room));
buffer_write(_buffer, buffer_string, PEd_roomGetCode(_room));
buffer_write(_buffer, buffer_string, PEd_roomGetCaption(_room));

////////////////////////////////////////////////////////////////////////////////
// Write views
for (var i = 0; i < 8; i++)
{
    var _viewport = PEd_roomGetViewport(_room, i);
    buffer_write(_buffer, buffer_bool, PEd_viewportGetVisible(_viewport));
    buffer_write(_buffer, buffer_u32, PEd_viewportGetX(_viewport));
    buffer_write(_buffer, buffer_u32, PEd_viewportGetY(_viewport));
    buffer_write(_buffer, buffer_u32, PEd_viewportGetWidth(_viewport));
    buffer_write(_buffer, buffer_u32, PEd_viewportGetHeight(_viewport));
    buffer_write(_buffer, buffer_u32, PEd_viewportGetPortX(_viewport));
    buffer_write(_buffer, buffer_u32, PEd_viewportGetPortY(_viewport));
    buffer_write(_buffer, buffer_u32, PEd_viewportGetPortWidth(_viewport));
    buffer_write(_buffer, buffer_u32, PEd_viewportGetPortHeight(_viewport));
    buffer_write(_buffer, buffer_u32, PEd_viewportGetBorderHor(_viewport));
    buffer_write(_buffer, buffer_u32, PEd_viewportGetBorderVer(_viewport));
    buffer_write(_buffer, buffer_f32, PEd_viewportGetSpeedHor(_viewport));
    buffer_write(_buffer, buffer_f32, PEd_viewportGetSpeedVer(_viewport));
    
    var _objName = "<undefined>";
    var _obj = PEd_viewportGetObject(_viewport);
    if (_obj >= 0)
    {
        _objName = object_get_name(_obj);
    }
    buffer_write(_buffer, buffer_string, _objName);
}

////////////////////////////////////////////////////////////////////////////////
// Write backgrounds
for (var i = 0; i < 8; i++)
{
    var _background = PEd_roomGetBackground(_room, i);
    buffer_write(_buffer, buffer_bool, PEd_backgroundGetVisible(_background));
    buffer_write(_buffer, buffer_bool, PEd_backgroundIsForeground(_background));
    buffer_write(_buffer, buffer_bool, PEd_backgroundGetStretch(_background));
    buffer_write(_buffer, buffer_bool, PEd_backgroundGetTiledHor(_background));
    buffer_write(_buffer, buffer_bool, PEd_backgroundGetTiledVer(_background));
    buffer_write(_buffer, buffer_f32, PEd_backgroundGetX(_background));
    buffer_write(_buffer, buffer_f32, PEd_backgroundGetY(_background));
    buffer_write(_buffer, buffer_f32, PEd_backgroundGetSpeedHor(_background));
    buffer_write(_buffer, buffer_f32, PEd_backgroundGetSpeedVer(_background));
    
    var _bgName = "<undefined>";
    var _bg = PEd_backgroundGetImage(_background);
    if (_bg >= 0)
    {
        _bgName = background_get_name(_bg);
    }
    buffer_write(_buffer, buffer_string, _bgName);
}

////////////////////////////////////////////////////////////////////////////////
// Write physics
var _physicsWorld = PEd_roomGetPhysicsWorld(_room);
buffer_write(_buffer, buffer_bool, PEd_physicsWorldGetEnabled(_physicsWorld));
buffer_write(_buffer, buffer_f32, PEd_physicsWorldGetGravityX(_physicsWorld));
buffer_write(_buffer, buffer_f32, PEd_physicsWorldGetGravityY(_physicsWorld));
buffer_write(_buffer, buffer_f32, PEd_physicsWorldGetPxToM(_physicsWorld));

////////////////////////////////////////////////////////////////////////////////
// Write instances
var _instances = PEd_roomGetInstances(_room);
var _instanceCount = ds_list_size(_instances);

buffer_write(_buffer, buffer_u32, _instanceCount);

for (var i = 0; i < _instanceCount; i++)
{
    var _inst = _instances[|i];
    PEd_instanceAutocompleteCode(_inst);
    buffer_write(_buffer, buffer_string, PEd_instanceGetObjectName(_inst));
    buffer_write(_buffer, buffer_string, PEd_instanceGetName(_inst));
    buffer_write(_buffer, buffer_string, PEd_instanceGetCode(_inst));
    buffer_write(_buffer, buffer_f32, PEd_instanceGetPosX(_inst));
    buffer_write(_buffer, buffer_f32, PEd_instanceGetPosY(_inst));
    buffer_write(_buffer, buffer_f32, PEd_instanceGetScaleX(_inst));
    buffer_write(_buffer, buffer_f32, PEd_instanceGetScaleY(_inst));
    buffer_write(_buffer, buffer_f32, PEd_instanceGetRotZ(_inst));
    buffer_write(_buffer, buffer_u32, PEd_colourAlphaToArgb(PEd_instanceGetColour(_inst), PEd_instanceGetAlpha(_inst)));
}

////////////////////////////////////////////////////////////////////////////////
// Write tiles
var _tiles = PEd_roomGetTiles(_room);
var _tileCount = ds_list_size(_tiles);

buffer_write(_buffer, buffer_u32, _tileCount);

for (var i = 0; i < _tileCount; i++)
{
    var _tile = _tiles[|i];
    buffer_write(_buffer, buffer_string, background_get_name(tile_get_background(_tile)));
    buffer_write(_buffer, buffer_u32, tile_get_left(_tile));
    buffer_write(_buffer, buffer_u32, tile_get_top(_tile));
    buffer_write(_buffer, buffer_u32, tile_get_width(_tile));
    buffer_write(_buffer, buffer_u32, tile_get_height(_tile));
    buffer_write(_buffer, buffer_f32, tile_get_x(_tile));
    buffer_write(_buffer, buffer_f32, tile_get_y(_tile));
    buffer_write(_buffer, buffer_u32, tile_get_depth(_tile));
    buffer_write(_buffer, buffer_f32, tile_get_xscale(_tile));
    buffer_write(_buffer, buffer_f32, tile_get_yscale(_tile));
    buffer_write(_buffer, buffer_u32, PEd_colourAlphaToArgb(tile_get_blend(_tile), tile_get_alpha(_tile)));
}

////////////////////////////////////////////////////////////////////////////////
//
// Save buffer
//
buffer_save(_buffer, _path);
buffer_delete(_buffer);
return true;
