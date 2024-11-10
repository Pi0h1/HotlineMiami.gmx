/// PEd_roomSaveToGMX(room, file)
/**
 * @brief Saves the room into the *.room.gmx file.
 * @return {real} True on success.
 */
var _room = argument0;
var _path = argument1;
var _roomName = string_replace(filename_name(_path), ".room.gmx", "");
PEd_roomSetName(_room, _roomName);

////////////////////////////////////////////////////////////////////////////////
//
// Create XML document
//
var _root = PEd_xmlCreateElement("room");

PEd_xmlAddChildElement(_root,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("caption"),
        PEd_roomGetCaption(_room)));

PEd_xmlAddChildElement(_root,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("width"),
        PEd_roomGetWidth(_room)));
        
PEd_xmlAddChildElement(_root,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("height"),
        PEd_roomGetHeight(_room)));
        
PEd_xmlAddChildElement(_root,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("vsnap"),
        PEd_roomGetSnapV(_room)));
        
PEd_xmlAddChildElement(_root,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("hsnap"),
        PEd_roomGetSnapH(_room)));
        
PEd_xmlAddChildElement(_root,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("isometric"), 0));
        
PEd_xmlAddChildElement(_root,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("speed"),
        PEd_roomGetSpeed(_room)));
        
PEd_xmlAddChildElement(_root,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("persistent"),
        -PEd_roomGetPersistent(_room)));
        
PEd_xmlAddChildElement(_root,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("colour"),
        PEd_roomGetColour(_room)));
        
PEd_xmlAddChildElement(_root,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("showcolour"),
        PEd_roomGetShowColour(_room)));
        
PEd_xmlAddChildElement(_root,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("code"),
        PEd_roomGetCode(_room)));
        
PEd_xmlAddChildElement(_root,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("enableViews"), -1));
        
PEd_xmlAddChildElement(_root,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("clearViewBackground"), -1));
  
PEd_xmlAddChildElement(_root,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("clearDisplayBuffer"), -1));

////////////////////////////////////////////////////////////////////////////////
// Maker 
var _makerSettings = PEd_xmlCreateElement("makerSettings");
PEd_xmlAddChildElement(_makerSettings,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("isSet"), 0));
        
PEd_xmlAddChildElement(_makerSettings,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("w"), 0));
        
PEd_xmlAddChildElement(_makerSettings,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("h"), 0));
        
PEd_xmlAddChildElement(_makerSettings,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("showGrid"),
        -PEd_roomGetGrid(_room)));

PEd_xmlAddChildElement(_makerSettings,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("showObjects"), 0));
        
PEd_xmlAddChildElement(_makerSettings,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("showTiles"), 0));
        
PEd_xmlAddChildElement(_makerSettings,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("showBackgrounds"), 0));
        
PEd_xmlAddChildElement(_makerSettings,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("showForegrounds"), 0));
        
PEd_xmlAddChildElement(_makerSettings,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("showViews"), 0));
        
PEd_xmlAddChildElement(_makerSettings,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("deleteUnderlyingObj"), 0));
        
PEd_xmlAddChildElement(_makerSettings,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("deleteUnderlyingTiles"), 0));
        
PEd_xmlAddChildElement(_makerSettings,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("page"), 0));
        
PEd_xmlAddChildElement(_makerSettings,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("xoffset"), 0));
        
PEd_xmlAddChildElement(_makerSettings,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("yoffset"), 0));
        
PEd_xmlAddChildElement(_root, _makerSettings);

var _backgrounds = PEd_xmlCreateElement("backgrounds");
var _views = PEd_xmlCreateElement("views");

for (var i = 0; i < 8; i++)
{
    ////////////////////////////////////////////////////////////////////////////
    // Backgrounds
    var _background = PEd_roomGetBackground(_room, i);
    var _bgrElement = PEd_xmlCreateElement("background");
    
    PEd_xmlSetElementAttribute(
        _bgrElement, "visible", -PEd_backgroundGetVisible(_background));
    PEd_xmlSetElementAttribute(
        _bgrElement, "foreground", -PEd_backgroundIsForeground(_background));
        
    var _bgrName = "";
    var _index = PEd_backgroundGetImage(_background);
    if (_index >= 0)
    {
        _bgrName = background_get_name(_index);
    }
    PEd_xmlSetElementAttribute(_bgrElement, "name", _bgrName);
    
    PEd_xmlSetElementAttribute(
        _bgrElement, "x", PEd_backgroundGetX(_background));
    PEd_xmlSetElementAttribute(
        _bgrElement, "y", PEd_backgroundGetY(_background));
    PEd_xmlSetElementAttribute(
        _bgrElement, "htiled", -PEd_backgroundGetTiledHor(_background));
    PEd_xmlSetElementAttribute(
        _bgrElement, "vtiled", -PEd_backgroundGetTiledVer(_background));
    PEd_xmlSetElementAttribute(
        _bgrElement, "hspeed", PEd_backgroundGetSpeedHor(_background));
    PEd_xmlSetElementAttribute(
        _bgrElement, "vspeed", PEd_backgroundGetSpeedVer(_background));
    PEd_xmlSetElementAttribute(
        _bgrElement, "stretch", -PEd_backgroundGetStretch(_background));
        
    PEd_xmlAddChildElement(_backgrounds, _bgrElement);
        
    ////////////////////////////////////////////////////////////////////////////
    // Views
    var _viewport = PEd_roomGetViewport(_room, i);
    var _viewElem = PEd_xmlCreateElement("view");
    
    PEd_xmlSetElementAttribute(
        _viewElem, "visible", -PEd_viewportGetVisible(_viewport));
        
    var _objName = "<undefined>";
    var _index = PEd_viewportGetObject(_viewport);
    if (_index >= 0)
    {
        _objName = object_get_name(_index);
    }
    PEd_xmlSetElementAttribute(_viewElem, "objName", _objName);
    
    PEd_xmlSetElementAttribute(
        _viewElem, "xview", PEd_viewportGetX(_viewport));
    PEd_xmlSetElementAttribute(
        _viewElem, "yview", PEd_viewportGetY(_viewport));
    PEd_xmlSetElementAttribute(
        _viewElem, "wview", PEd_viewportGetWidth(_viewport));
    PEd_xmlSetElementAttribute(
        _viewElem, "hview", PEd_viewportGetHeight(_viewport));
    PEd_xmlSetElementAttribute(
        _viewElem, "xport", PEd_viewportGetPortX(_viewport));
    PEd_xmlSetElementAttribute(
        _viewElem, "yport", PEd_viewportGetPortY(_viewport));
    PEd_xmlSetElementAttribute(
        _viewElem, "wport", PEd_viewportGetPortWidth(_viewport));
    PEd_xmlSetElementAttribute(
        _viewElem, "hport", PEd_viewportGetPortHeight(_viewport));
    PEd_xmlSetElementAttribute(
        _viewElem, "hborder", PEd_viewportGetBorderHor(_viewport));
    PEd_xmlSetElementAttribute(
        _viewElem, "vborder", PEd_viewportGetBorderVer(_viewport));
    PEd_xmlSetElementAttribute(
        _viewElem, "hspeed", PEd_viewportGetSpeedHor(_viewport));
    PEd_xmlSetElementAttribute(
        _viewElem, "vspeed", PEd_viewportGetSpeedVer(_viewport));
        
    PEd_xmlAddChildElement(_views, _viewElem);
}

PEd_xmlAddChildElement(_root, _backgrounds);
PEd_xmlAddChildElement(_root, _views);

////////////////////////////////////////////////////////////////////////////////
// Instances
var _instances = PEd_xmlCreateElement("instances");
var _instList = PEd_roomGetInstances(_room);
var _instCount = ds_list_size(_instList);

for (var i = 0; i < _instCount; i++)
{
    var _inst = _instList[| i];
    PEd_instanceAutocompleteCode(_inst);
    
    var _instElem = PEd_xmlCreateElement("instance");
    
    PEd_xmlSetElementAttribute(
        _instElem, "objName", PEd_instanceGetObjectName(_inst));
    PEd_xmlSetElementAttribute(
        _instElem, "x", PEd_instanceGetPosX(_inst));
    PEd_xmlSetElementAttribute(
        _instElem, "y", PEd_instanceGetPosY(_inst));
    PEd_xmlSetElementAttribute(
        _instElem, "name", PEd_instanceGetName(_inst));
    PEd_xmlSetElementAttribute(
        _instElem, "locked", 0);
    PEd_xmlSetElementAttribute(
        _instElem, "code", PEd_instanceGetCode(_inst));
    PEd_xmlSetElementAttribute(
        _instElem, "scaleX", PEd_instanceGetScaleX(_inst));
    PEd_xmlSetElementAttribute(
        _instElem, "scaleY", PEd_instanceGetScaleY(_inst));
    PEd_xmlSetElementAttribute(
        _instElem, "colour",
            PEd_colourAlphaToArgb(PEd_instanceGetColour(_inst),
                                  PEd_instanceGetAlpha(_inst)));
    PEd_xmlSetElementAttribute(
        _instElem, "rotation", PEd_instanceGetRotZ(_inst));
        
    PEd_xmlAddChildElement(_instances, _instElem);
}

PEd_xmlAddChildElement(_root, _instances);

////////////////////////////////////////////////////////////////////////////////
// Tiles
var _tiles = PEd_xmlCreateElement("tiles");
var _tileList = PEd_roomGetTiles(_room);
var _tileCount = ds_list_size(_tileList);

for (var i = 0; i < _tileCount; i++)
{
    var _tile = _tileList[| i];
    var _tileElem = PEd_xmlCreateElement("tile");
    
    PEd_xmlSetElementAttribute(
        _tileElem, "bgName", background_get_name(tile_get_background(_tile)));
    PEd_xmlSetElementAttribute(
        _tileElem, "x", tile_get_x(_tile));
    PEd_xmlSetElementAttribute(
        _tileElem, "y", tile_get_y(_tile));
    PEd_xmlSetElementAttribute(
        _tileElem, "w", tile_get_width(_tile));
    PEd_xmlSetElementAttribute(
        _tileElem, "h", tile_get_height(_tile));
    PEd_xmlSetElementAttribute(
        _tileElem, "xo", tile_get_left(_tile));
    PEd_xmlSetElementAttribute(
        _tileElem, "yo", tile_get_top(_tile));
    PEd_xmlSetElementAttribute(
        _tileElem, "id", string(_tile));
    PEd_xmlSetElementAttribute(
        _tileElem, "name", "tile_" + string(_tile));
    PEd_xmlSetElementAttribute(
        _tileElem, "depth", tile_get_depth(_tile));
    PEd_xmlSetElementAttribute(
        _tileElem, "locked", 0);;
    PEd_xmlSetElementAttribute(
        _tileElem, "colour",
            PEd_colourAlphaToArgb(tile_get_blend(_tile), tile_get_alpha(_tile)));
    PEd_xmlSetElementAttribute(
        _tileElem, "scaleX", tile_get_xscale(_tile));
    PEd_xmlSetElementAttribute(
        _tileElem, "scaleY", tile_get_yscale(_tile))
        
    PEd_xmlAddChildElement(_tiles, _tileElem);
}

PEd_xmlAddChildElement(_root, _tiles);

////////////////////////////////////////////////////////////////////////////////
// Physics
var _physicsWorld = PEd_roomGetPhysicsWorld(_room);

PEd_xmlAddChildElement(_root,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("PhysicsWorld"),
        -PEd_physicsWorldGetEnabled(_physicsWorld)));
        
PEd_xmlAddChildElement(_root,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("PhysicsWorldTop"), 0));

PEd_xmlAddChildElement(_root,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("PhysicsWorldLeft"), 0));
        
PEd_xmlAddChildElement(_root,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("PhysicsWorldRight"),
        PEd_roomGetWidth(_room)));
        
PEd_xmlAddChildElement(_root,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("PhysicsWorldBottom"),
        PEd_roomGetHeight(_room)));
    
PEd_xmlAddChildElement(_root,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("PhysicsWorldGravityX"),
        PEd_physicsWorldGetGravityX(_physicsWorld)));
  
PEd_xmlAddChildElement(_root,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("PhysicsWorldGravityY"),
        PEd_physicsWorldGetGravityY(_physicsWorld)));
    
PEd_xmlAddChildElement(_root,
    PEd_xmlSetElementValue(
        PEd_xmlCreateElement("PhysicsWorldPixToMeters"),
        PEd_physicsWorldGetPxToM(_physicsWorld)));
        
////////////////////////////////////////////////////////////////////////////////
//
// Write xml document
//
var _string = PEd_xmlWrite(_root);
PEd_xmlDestroyElement(_root);
var _file = file_text_open_write(_path);
if (_file != -1)
{
    file_text_write_string(_file, _string);
    file_text_close(_file);
    return true;
}
 
return false;
