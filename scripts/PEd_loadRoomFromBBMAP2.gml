/// PEd_loadRoomFromBBMAP2(file)
/**
 * @brief Loads a room from the external *.bbmap version 2 file.
 * @param {string} file The name of the file to load from.
 * @return {real} The id of the room or noone on fail.
 */
var _path = argument0;

////////////////////////////////////////////////////////////////////////////////
//
// Load buffer
//
var _buffer = buffer_load(_path);
buffer_seek(_buffer, buffer_seek_start, 0);

// Check bbmap version
if (buffer_read(_buffer, buffer_u8) != 2)
{
    buffer_delete(_buffer);
    return noone;
}

////////////////////////////////////////////////////////////////////////////////
//
// Create room
//
var _roomName = string_replace(filename_name(_path), ".bbmap", "");
var _room = PEd_createRoom(_roomName, 512, 512);

////////////////////////////////////////////////////////////////////////////////
// Read room data
PEd_roomSetWidth(_room,         buffer_read(_buffer, buffer_u32));
PEd_roomSetHeight(_room,        buffer_read(_buffer, buffer_u32));
PEd_roomSetSpeed(_room,         buffer_read(_buffer, buffer_u32));
PEd_roomSetColour(_room,        buffer_read(_buffer, buffer_u32));
PEd_roomSetShowColour(_room,    buffer_read(_buffer, buffer_bool));
PEd_roomSetPersistent(_room,    buffer_read(_buffer, buffer_bool));
PEd_roomSetCode(_room,          buffer_read(_buffer, buffer_string));
PEd_roomSetCaption(_room,       buffer_read(_buffer, buffer_string));

////////////////////////////////////////////////////////////////////////////////
// Read views
for (var i = 0; i < 8; i++)
{
    var _viewport = PEd_roomGetViewport(_room, i);
    PEd_viewportSetVisible(_viewport,       buffer_read(_buffer, buffer_bool));
    PEd_viewportSetX(_viewport,             buffer_read(_buffer, buffer_u32));
    PEd_viewportSetY(_viewport,             buffer_read(_buffer, buffer_u32));
    PEd_viewportSetWidth(_viewport,         buffer_read(_buffer, buffer_u32));
    PEd_viewportSetHeight(_viewport,        buffer_read(_buffer, buffer_u32));
    PEd_viewportSetPortX(_viewport,         buffer_read(_buffer, buffer_u32));
    PEd_viewportSetPortY(_viewport,         buffer_read(_buffer, buffer_u32));
    PEd_viewportSetPortWidth(_viewport,     buffer_read(_buffer, buffer_u32));
    PEd_viewportSetPortHeight(_viewport,    buffer_read(_buffer, buffer_u32));
    PEd_viewportSetBorderHor(_viewport,     buffer_read(_buffer, buffer_u32));
    PEd_viewportSetBorderVer(_viewport,     buffer_read(_buffer, buffer_u32));
    PEd_viewportSetSpeedHor(_viewport,      buffer_read(_buffer, buffer_f32));
    PEd_viewportSetSpeedVer(_viewport,      buffer_read(_buffer, buffer_f32));
    
    var _objName = buffer_read(_buffer, buffer_string);
    var _obj = noone;
    if (_objName != "<undefined>")
    {
        _obj = asset_get_index(_objName);
    }
    
    if (_obj >= 0)
    {
        PEd_viewportSetObject(_viewport, _obj);
    }
    else if (_obj != noone)
    {
        show_error("Could not set view " + string(i) + " to follow object '" + _objName + "'. Object was not found.", false);
    }
}

////////////////////////////////////////////////////////////////////////////////
// Read backgrounds
for (var i = 0; i < 8; i++)
{
    var _background = PEd_roomGetBackground(_room, i);
    PEd_backgroundSetVisible(_background,       buffer_read(_buffer, buffer_bool));
    PEd_backgroundSetAsForeground(_background,  buffer_read(_buffer, buffer_bool));
    PEd_backgroundSetStretch(_background,       buffer_read(_buffer, buffer_bool));
    PEd_backgroundSetTiledHor(_background,      buffer_read(_buffer, buffer_bool));
    PEd_backgroundSetTiledVer(_background,      buffer_read(_buffer, buffer_bool));
    PEd_backgroundSetX(_background,             buffer_read(_buffer, buffer_f32));
    PEd_backgroundSetY(_background,             buffer_read(_buffer, buffer_f32));
    PEd_backgroundSetSpeedHor(_background,      buffer_read(_buffer, buffer_f32));
    PEd_backgroundSetSpeedVer(_background,      buffer_read(_buffer, buffer_f32));
    
    var _bgName = buffer_read(_buffer, buffer_string);
    var _bg = noone;
    if (_bgName != "<undefined>")
    {
        _bg = asset_get_index(_bgName);
    }
    
    if (_bg >= 0)
    {
        PEd_backgroundSetImage(_background, _bg);
    }
    else if (_bg != noone)
    {
        show_error("Could not set background " + string(i) + " to '" + _bgName + "'. Background was not found.", false);
    }
}

////////////////////////////////////////////////////////////////////////////////
// Read physics
var _physicsWorld = PEd_roomGetPhysicsWorld(_room);
PEd_physicsWorldSetEnabled(_physicsWorld,   buffer_read(_buffer, buffer_bool));
PEd_physicsWorldSetGravityX(_physicsWorld,  buffer_read(_buffer, buffer_f32));
PEd_physicsWorldSetGravityY(_physicsWorld,  buffer_read(_buffer, buffer_f32));
PEd_physicsWorldSetPxToM(_physicsWorld,     buffer_read(_buffer, buffer_f32));

////////////////////////////////////////////////////////////////////////////////
// Read instances
var _instanceCount = buffer_read(_buffer, buffer_u32);

for (var i = 0; i < _instanceCount; i++)
{
    var _objName = buffer_read(_buffer, buffer_string);
    var _instName = buffer_read(_buffer, buffer_string);
    var _code = buffer_read(_buffer, buffer_string);
    var _x = buffer_read(_buffer, buffer_f32);
    var _y = buffer_read(_buffer, buffer_f32);
    var _scaleX = buffer_read(_buffer, buffer_f32);
    var _scaleY = buffer_read(_buffer, buffer_f32);
    var _rotation = buffer_read(_buffer, buffer_f32);
    var _argb = buffer_read(_buffer, buffer_u32);
    
    var _obj = asset_get_index(_objName);
    if (_obj >= 0)
    {
        var _inst = PEd_instanceCreate(_room, _x, _y, _obj);
        PEd_instanceSetName(_inst, _instName);
        PEd_instanceSetCode(_inst, _code);
        PEd_instanceSetScaleX(_inst, _scaleX);
        PEd_instanceSetScaleY(_inst, _scaleY);
        PEd_instanceSetRotZ(_inst, _rotation);
        PEd_instanceSetColour(_inst, PEd_argbToColour(_argb));
        PEd_instanceSetAlpha(_inst, PEd_argbToAlpha(_argb));
        
        with (_inst) 
        {
            PEd_codeProcess(_code);
        }
    }
    else
    {
        show_error("Object '" + _objName + "' was not found. Could not create instance '" + _instName + "'.", false);
    }
}

////////////////////////////////////////////////////////////////////////////////
// Read tiles
var _tileCount = buffer_read(_buffer, buffer_u32);

for (var i = 0; i < _tileCount; i++)
{
    var _bgName = buffer_read(_buffer, buffer_string);
    var _left = buffer_read(_buffer, buffer_u32);
    var _top = buffer_read(_buffer, buffer_u32);
    var _width = buffer_read(_buffer, buffer_u32);
    var _height = buffer_read(_buffer, buffer_u32);
    var _x = buffer_read(_buffer, buffer_f32);
    var _y = buffer_read(_buffer, buffer_f32);
    var _depth = buffer_read(_buffer, buffer_u32);
    var _scaleX = buffer_read(_buffer, buffer_f32);
    var _scaleY = buffer_read(_buffer, buffer_f32);
    var _argb = buffer_read(_buffer, buffer_u32);
    
    var _bg = asset_get_index(_bgName);
    if (_bg >= 0)
    {
        var _tile = PEd_createTile(_room, _bg, _left, _top, _width, _height, _x, _y, _depth);
        tile_set_scale(_tile, _scaleX, _scaleY);
        tile_set_blend(_tile, PEd_argbToColour(_argb));
        tile_set_alpha(_tile, PEd_argbToAlpha(_argb));
    }
    else
    {
        show_error("Could not create tile from '" + _bgName + "'. Background was not found.", false);
    }
}

////////////////////////////////////////////////////////////////////////////////
//
// Delete buffer and return room
//
buffer_delete(_buffer);
return _room;
