/// PEd_loadRoomFromBBMAP(file)
/**
 * @brief Loads a room from the external *.bbmap file.
 * @param {string} file The name of the file to import from.
 * @return {real} The id of the room or noone on fail.
 */
var _path = argument0;

if (!file_exists(_path)) 
{
    return 0;
}

////////////////////////////////////////////////////////////////////////////////
//
// Variables
//
var _isEditor = instance_exists(PEd_oEditor);
var _map = ds_map_create();
var _listInstances = ds_list_create();
var _listBackgrounds = ds_list_create();
var _listTiles = ds_list_create();
var _listViews = ds_list_create();

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
//  Map and lists
//
ds_map_read(_map, _source);

var _instances = _map[? "instances"];
if (!is_undefined(_instances))
{
    ds_list_read(_listInstances, _instances);
}

var _backgrounds = _map[? "backgrounds"];
if (!is_undefined(_backgrounds))
{
    ds_list_read(_listBackgrounds, _backgrounds);
}

var _tiles = _map[? "tiles"];
if (!is_undefined(_tiles))
{
    ds_list_read(_listTiles, _tiles);
}

var _views = _map[? "views"];
if (!is_undefined(_views))
{
    ds_list_read(_listViews, _views);
}
else
{
    show_error("Could not load BBMAP from '" + _path + "'. The file does not contain viewports definition.", false);
    ds_map_destroy(_map);
    ds_list_destroy(_listInstances);
    ds_list_destroy(_listBackgrounds);
    ds_list_destroy(_listViews);
    ds_list_destroy(_listTiles);
    return noone;
}

////////////////////////////////////////////////////////////////////////////////
//
// Create room
//
var _name = string_replace(_path, filename_dir(_path) + "\", "");
    _name = string_replace(_name, ".bbmap", "");
var _width = _map[? "width"];
var _height = _map[? "height"];

if (is_undefined(_width)
    || is_undefined(_height))
{
    show_error("Could not load BBMAP from '" + _path + "'. The file does not contain room size definition.", false);
    ds_map_destroy(_map);
    ds_list_destroy(_listInstances);
    ds_list_destroy(_listBackgrounds);
    ds_list_destroy(_listViews);
    ds_list_destroy(_listTiles);
    return noone;
}

var _room = PEd_createRoom(_name, _width, _height);
var _snapVer = _map[? "vsnap"];
var _snapHor = _map[? "hsnap"];
var _code = _map[? "code"];
var _showGrid = _map[? "showGrid"];
var _caption = _map[? "caption"];
var _speed = _map[? "speed"];
var _persistent = _map[? "persistent"];
var _colour = _map[? "colour"];

if (is_undefined(_snapVer)
    || is_undefined(_snapHor)
    || is_undefined(_code)
    || is_undefined(_showGrid)
    || is_undefined(_caption)
    || is_undefined(_speed)
    || is_undefined(_persistent)
    || is_undefined(_colour))
{
    show_error("Could not load BBMAP from '" + _path + "'. The file is corrupted.", false);
    ds_map_destroy(_map);
    ds_list_destroy(_listInstances);
    ds_list_destroy(_listBackgrounds);
    ds_list_destroy(_listViews);
    ds_list_destroy(_listTiles);
    return noone;
}

PEd_roomSetSnapV(_room, _snapVer);
PEd_roomSetSnapH(_room, _snapHor);
PEd_roomSetCode(_room, _code);
PEd_roomSetGrid(_room, _showGrid);
PEd_roomSetCaption(_room, _caption);
PEd_roomSetSpeed(_room, _speed);
PEd_roomSetPersistent(_room, _persistent);
PEd_roomSetColour(_room, _colour);

if (!_isEditor)
{
    room_caption = _caption;
    room_speed = _speed;
    room_persistent = _persistent;
    background_colour = _colour;
    
    room_set_width(room, _width);
    room_set_height(room, _height);
}

////////////////////////////////////////////////////////////////////////////////
//
// Physics
//
if (_map[? "PhysicsWorld"]) 
{
    var _gravityX = _map[? "PhysicsWorldGravityX"];
    var _gravityY = _map[? "PhysicsWorldGravityY"];
    var _pxToM = _map[? "PhysicsWorldPixToMeters"];

    var _physicsWorld = PEd_roomGetPhysicsWorld(_room);
    PEd_physicsWorldSetEnabled(_physicsWorld, true);
    PEd_physicsWorldSetGravityX(_physicsWorld, _gravityX);
    PEd_physicsWorldSetGravityY(_physicsWorld, _gravityY);
    PEd_physicsWorldSetPxToM(_physicsWorld, _pxToM);

    if (!_isEditor)
    {
        physics_world_create(_pxToM);
        physics_world_gravity(_gravityX, _gravityY);
    }
}

////////////////////////////////////////////////////////////////////////////////
//
// Backgrounds
//
for (var i = 0; i < ds_list_size(_listBackgrounds); i += 10) 
{
    var j = i div 10;
    
    var _background = PEd_roomGetBackground(_room, j);
    var _image = _listBackgrounds[| i + 2];
    
    if (background_exists(_image))
    {
        var _visible = _listBackgrounds[| i];
        var _isForeground = _listBackgrounds[| i + 1];
        var _x = _listBackgrounds[| i + 3];
        var _y = _listBackgrounds[| i + 4];
        var _tiledHor = _listBackgrounds[| i + 5];
        var _tiledVer = _listBackgrounds[| i + 6];
        var _speedHor = _listBackgrounds[| i + 7];
        var _speedVer = _listBackgrounds[| i + 8];
        var _stretch = _listBackgrounds[| i + 9];
    
        PEd_backgroundSetVisible(_background, _visible);
        PEd_backgroundSetAsForeground(_background, _isForeground);
        PEd_backgroundSetImage(_background, _image);
        PEd_backgroundSetX(_background, _x);
        PEd_backgroundSetY(_background, _y);
        PEd_backgroundSetTiledHor(_background, _tiledHor);
        PEd_backgroundSetTiledVer(_background, _tiledVer);
        PEd_backgroundSetSpeedHor(_background, _speedHor);
        PEd_backgroundSetSpeedVer(_background, _speedVer);
        PEd_backgroundSetStretch(_background, _stretch);
        
        background_visible[j] = _visible;
        background_foreground[j] = _isForeground;
        background_index[j] = _image;
        background_x[j] = _x;
        background_y[j] = _y;
        background_htiled[j] = _tiledHor;
        background_vtiled[j] = _tiledVer;
        background_hspeed[j] = _speedHor;
        background_vspeed[j] = _speedVer;
        
        if (_stretch) 
        {
            background_xscale[j] = PEd_roomGetWidth(_room) / background_get_width(_image);
            background_yscale[j] = PEd_roomGetHeight(_room) / background_get_height(_image);
        }
        else 
        {
            background_xscale[j] = 1;
            background_yscale[j] = 1;
        }
    }
    else
    {
        show_error("Could not set background " + string(i) + " to " + string(_image) + ". Background was not found.", false);
    }
}

////////////////////////////////////////////////////////////////////////////////
//
// Views
//
for (var i = 0; i < ds_list_size(_listViews); i += 14) 
{
    var _viewport = PEd_roomGetViewport(_room, i div 14);
    var _visible = _listViews[| i];
    var _object = _listViews[| i + 1];
    var _x = _listViews[| i + 2];
    var _y = _listViews[| i + 3];
    var _width = _listViews[| i + 4];
    var _height = _listViews[| i + 5];
    var _portX = _listViews[| i + 6];
    var _portY = _listViews[| i + 7];
    var _portWidth = _listViews[| i + 8];
    var _portHeight = _listViews[| i + 9];
    var _borderHor = _listViews[| i + 10];
    var _borderVer = _listViews[| i + 11];
    var _speedHor = _listViews[| i + 12];
    var _speedVer = _listViews[| i + 13];
    
    PEd_viewportSetVisible(_viewport, _visible);
    if (object_exists(_object))
    {
        PEd_viewportSetObject(_viewport, _object);
    }
    else
    {
        show_error("Could not set view " + string(i) + " to follow object " + string(_object) + ". Object was not found.", false);
    }
    PEd_viewportSetX(_viewport, _x);
    PEd_viewportSetY(_viewport, _y);
    PEd_viewportSetWidth(_viewport, _portWidth);
    PEd_viewportSetHeight(_viewport, _portHeight);
    PEd_viewportSetBorderHor(_viewport, _borderHor);
    PEd_viewportSetBorderVer(_viewport, _borderVer);
    PEd_viewportSetSpeedHor(_viewport, _speedHor);
    PEd_viewportSetSpeedVer(_viewport, _speedVer);
    
    if (!_isEditor)
    {
        view_visible[j] = _visible;
        view_object[j] = _object;
        view_xview[j] = _x;
        view_yview[j] = _y;
        view_wview[j] = _width;
        view_hview[j] = _height;
        view_xport[j] = _portX;
        view_yport[j] = _portY;
        view_wport[j] = _portWidth;
        view_hport[j] = _portHeight;
        view_hborder[j] = _borderHor;
        view_vborder[j] = _borderVer;
        view_hspeed[j] = _speedHor;
        view_vspeed[j] = _speedVer;
    }
}

////////////////////////////////////////////////////////////////////////////////
//
// Tiles
//
for (var i = 0; i < ds_list_size(_listTiles); i += 14) 
{
    var _image = _listTiles[| i];
    
    if (background_exists(_image))
    {
        var _x = _listTiles[| i + 1];
        var _y = _listTiles[| i + 2];
        var _depth = _listTiles[| i + 9];
        var _width = _listTiles[| i + 3];
        var _height = _listTiles[| i + 4];
        var _left = _listTiles[| i + 5];
        var _top = _listTiles[| i + 6],
        var _blend = _listTiles[| i + 10];
        var _scaleX = _listTiles[| i + 11];
        var _scaleY = _listTiles[| i + 12];
        var _alpha = _listTiles[| i + 13];
        
        var _id = tile_add(_image, _left, _top, _width, _height, _x, _y, _depth);
        tile_set_blend(_id, _blend);
        tile_set_scale(_id, _scaleX, _scaleY);
        tile_set_alpha(_id, _alpha);
        
        if (_isEditor)
        {
            if (ds_list_find_index(tileLayers, _depth) == -1) 
            {
                ds_list_add(tileLayers, _depth);
                ds_list_add(tileVisible, true);
            }
            
            var _tiles = PEd_roomGetTiles(_room);
            ds_list_add(_tiles, _id);
        }
    }
    else
    {
        show_error("Could not create tile from " + string(_image) + ". Background was not found.", false);
    }
}

////////////////////////////////////////////////////////////////////////////////
//
// Instances
//
for (var i = 0; i < ds_list_size(_listInstances); i += 10) 
{
    var _objName = _listInstances[| i];
    var _object = asset_get_index(_objName);
    var _name = _listInstances[| i + 4];
    
    if (_object != -1)
    {    
        var _x = _listInstances[| i + 1];
        var _y = _listInstances[| i + 2];
        var _code = string_replace_all(_listInstances[| i + 3], " = ", "=");
        var _scaleX = _listInstances[| i + 5];
        var _scaleY = _listInstances[| i + 6];
        var _blend = _listInstances[| i + 7];
        var _alpha = _listInstances[| i + 8];
        var _rotation = _listInstances[| i + 9];
        
        var _id = PEd_instanceCreate(_room, _x, _y, _object);
        PEd_instanceSetPosX(_id, _x);
        PEd_instanceSetPosY(_id, _y);
        PEd_instanceSetScaleX(_id, _scaleX);
        PEd_instanceSetScaleY(_id, _scaleY);
        PEd_instanceSetColour(_id, _blend);
        PEd_instanceSetAlpha(_id, _alpha);
        PEd_instanceSetRotZ(_id, _rotation);
        PEd_instanceSetCode(_id, _code);
        PEd_instanceSetName(_id, _name);
        
        with (_id) 
        {
            PEd_codeProcess(_code);
        }
    }
    else
    {
        show_error("Object '" + _objName + "' was not found. Could not create instance '" + _name + "'.", false);
    }
}

// Destroy map and lists
ds_map_destroy(_map);
ds_list_destroy(_listInstances);
ds_list_destroy(_listBackgrounds);
ds_list_destroy(_listViews);
ds_list_destroy(_listTiles);

// Redraw panel if in editor
if (_isEditor) 
{
    PEd_guiRequestRedrawAll(guiRoot)
    PEd_guiShowPopupMessage("Room imported!");
}

return _room;
