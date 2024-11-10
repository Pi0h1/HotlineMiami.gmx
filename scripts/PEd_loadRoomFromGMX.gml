/// PEd_loadRoomFromGMX(file)
/**
 * @brief Loads a room from the XML file.
 * @param {string} file The path to the XML file.
 * @return {real} The id of the room or noone on fail.
 */
var _path = argument0;
var _root = PEd_xmlRead(_path);
if (_root == noone)
{
    return noone;
}

var _roomName = string_replace(filename_name(_path), ".room.gmx", "");
var _room = PEd_createRoom(_roomName, 512, 512);
var _physicsWorld = PEd_roomGetPhysicsWorld(_room);

show_debug_message(PEd_xmlWrite(_root));

////////////////////////////////////////////////////////////////////////////////
//
// Room settings
//
for (var i = PEd_xmlGetNumberOfChildElements(_root) - 1; i >= 0; i--)
{
    var _element = PEd_xmlGetChildElement(_root, i);
    var _name = PEd_xmlGetElementName(_element);
    var _value = PEd_xmlGetElementValue(_element);
    
    switch (_name)
    {
        case "caption":
            PEd_roomSetCaption(_room, _value);
            break;
            
        case "width":
            PEd_roomSetWidth(_room, _value);
            break;
            
        case "height":
            PEd_roomSetHeight(_room, _value);
            break;
            
        case "vsnap":
            PEd_roomSetSnapV(_room, _value);
            break;
            
        case "hsnap":
            PEd_roomSetSnapH(_room, _value);
            break;
            
        case "speed":
            PEd_roomSetSpeed(_room, _value);
            break;
        
        case "persistent":
            PEd_roomSetPersistent(_room, abs(_value));
            break;
            
        case "colour":
            PEd_roomSetColour(_room, _value);
            break;
            
        case "showcolour":
            PEd_roomSetShowColour(_room, abs(_value));
            break;
            
        case "code":
            PEd_roomSetCode(_room, _value);
            break;
            
        case "makerSettings":
            for (var j = PEd_xmlGetNumberOfChildElements(_element) - 1; j >= 0; j--)
            {
                var _child = PEd_xmlGetChildElement(_element, j);
                var _childName = PEd_xmlGetElementName(_child);
                var _childValue = PEd_xmlGetElementValue(_child);
                
                switch (_childName)
                {
                    case "showGrid":
                        PEd_roomSetGrid(_room, abs(_childValue));
                        break;
                }
            }
            break;
            
        case "PhysicsWorld":
            PEd_physicsWorldSetEnabled(_physicsWorld, abs(_value));
            break;
            
        case "PhysicsWorldGravityX":
            PEd_physicsWorldSetGravityX(_physicsWorld, _value);
            break;
            
        case "PhysicsWorldGravityY":
            PEd_physicsWorldSetGravityY(_physicsWorld, _value);
            break;
            
        case "PhysicsWorldPixToMeters":
            PEd_physicsWorldSetPxToM(_physicsWorld, _value);
            break;
    }
}

////////////////////////////////////////////////////////////////////////////////
//
// Load views
//
var _views = PEd_xmlFindAllElements(_root, "view");
var _numberOfViews = ds_list_size(_views);

for (var i = 0; i < _numberOfViews; i++)
{
    var _v = _views[| i];
    var _viewport = PEd_roomGetViewport(_room, i);
    PEd_viewportSetVisible(_viewport, abs(PEd_xmlGetElementAttribute(_v, "visible")));
    
    var _objName = PEd_xmlGetElementAttribute(_v, "objName");
    if (_objName != "<undefined>")
    { 
        var _obj = asset_get_index(_objName);
        if (_obj >= 0)
        {
            PEd_viewportSetObject(_viewport, _obj);
        }
        else
        {
            show_error("Could not set view " + string(i) + " to follow object '" + _objName + "'. Object was not found.", false);
        }
    }
    
    PEd_viewportSetX(_viewport, PEd_xmlGetElementAttribute(_v, "xview"));
    PEd_viewportSetY(_viewport, PEd_xmlGetElementAttribute(_v, "yview"));
    PEd_viewportSetWidth(_viewport, PEd_xmlGetElementAttribute(_v, "wview"));
    PEd_viewportSetHeight(_viewport, PEd_xmlGetElementAttribute(_v, "hview"));
    PEd_viewportSetPortX(_viewport, PEd_xmlGetElementAttribute(_v, "xport"));
    PEd_viewportSetPortY(_viewport, PEd_xmlGetElementAttribute(_v, "yport"));
    PEd_viewportSetPortWidth(_viewport, PEd_xmlGetElementAttribute(_v, "wport"));
    PEd_viewportSetPortHeight(_viewport, PEd_xmlGetElementAttribute(_v, "hport"));
    PEd_viewportSetBorderHor(_viewport, PEd_xmlGetElementAttribute(_v, "hborder"));
    PEd_viewportSetBorderVer(_viewport, PEd_xmlGetElementAttribute(_v, "vborder"));
    PEd_viewportSetSpeedHor(_viewport, PEd_xmlGetElementAttribute(_v, "hspeed"));
    PEd_viewportSetSpeedVer(_viewport, PEd_xmlGetElementAttribute(_v, "vspeed"));
}

////////////////////////////////////////////////////////////////////////////////
//
// Load backgrounds
//
var _backgrounds = PEd_xmlFindAllElements(_root, "background");
var _numberOfBackgrounds = ds_list_size(_backgrounds);

for (var i = 0; i < _numberOfBackgrounds; i++)
{
    var _bgr = _backgrounds[| i];
    var _background = PEd_roomGetBackground(_room, i);
    PEd_backgroundSetVisible(_background, abs(PEd_xmlGetElementAttribute(_bgr, "visible")));
    PEd_backgroundSetAsForeground(_background, abs(PEd_xmlGetElementAttribute(_bgr, "foreground")));
    var _name = PEd_xmlGetElementAttribute(_bgr, "name");
    if (is_string(_name))
    {
        var _bg = asset_get_index(_name)
        if (_bg >= 0)
        {
            PEd_backgroundSetImage(_background, _bg);
        }
        else
        {
            show_error("Could not set background " + string(i) + " to '" + _bgName + "'. Background was not found.", false);
        }
    }
    PEd_backgroundSetX(_background, PEd_xmlGetElementAttribute(_bgr, "x"));
    PEd_backgroundSetY(_background, PEd_xmlGetElementAttribute(_bgr, "y"));
    PEd_backgroundSetTiledHor(_background, abs(PEd_xmlGetElementAttribute(_bgr, "htiled")));
    PEd_backgroundSetTiledVer(_background, abs(PEd_xmlGetElementAttribute(_bgr, "vtiled")));
    PEd_backgroundSetSpeedHor(_background, PEd_xmlGetElementAttribute(_bgr, "hspeed"));
    PEd_backgroundSetSpeedVer(_background, PEd_xmlGetElementAttribute(_bgr, "vspeed"));
    PEd_backgroundSetStretch(_background, abs(PEd_xmlGetElementAttribute(_bgr, "stretch")));
}

////////////////////////////////////////////////////////////////////////////////
//
// Load instances
//
var _instances = PEd_xmlFindAllElements(_root, "instance");
var _numberOfInstances = ds_list_size(_instances);

for (var i = 0; i < _numberOfInstances; i++)
{
    var _inst = _instances[| i];
    var _objName = PEd_xmlGetElementAttribute(_inst, "objName");
    var _instName = PEd_xmlGetElementAttribute(_inst, "name");
    
    var _obj = asset_get_index(_objName);
    if (_obj >= 0)
    {
        var _id = PEd_instanceCreate(_room,
                                     PEd_xmlGetElementAttribute(_inst, "x"),
                                     PEd_xmlGetElementAttribute(_inst, "y"),
                                     _obj);
        
        PEd_instanceSetName(_id, _instName);
        
        var _code = PEd_xmlGetElementAttribute(_inst, "code");
        PEd_instanceSetCode(_id, _code);
        
        PEd_instanceSetScaleX(_id, PEd_xmlGetElementAttribute(_inst, "scaleX"));
        PEd_instanceSetScaleY(_id, PEd_xmlGetElementAttribute(_inst, "scaleY"));
        PEd_instanceSetRotZ(_id, PEd_xmlGetElementAttribute(_inst, "rotation"));
        
        var _argb = PEd_xmlGetElementAttribute(_inst, "colour");
        PEd_instanceSetColour(_id, PEd_argbToColour(_argb));
        PEd_instanceSetAlpha(_id, PEd_argbToAlpha(_argb));
        
        with (_id) 
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
//
// Load tiles
//
var _roomTileList = PEd_roomGetTiles(_room);
var _tiles = PEd_xmlFindAllElements(_root, "tile");
var _numberOfTiles = ds_list_size(_tiles);

for (var i = 0; i < _numberOfTiles; i++)
{
    var _t = _tiles[| i];
    var _bgName = PEd_xmlGetElementAttribute(_t, "bgName");
    var _bg = asset_get_index(_bgName);
    
    if (_bg >= 0)
    {
        var _id = PEd_createTile(_room,
                                 _bg,
                                 PEd_xmlGetElementAttribute(_t, "xo"),
                                 PEd_xmlGetElementAttribute(_t, "yo"),
                                 PEd_xmlGetElementAttribute(_t, "w"),
                                 PEd_xmlGetElementAttribute(_t, "h"),
                                 PEd_xmlGetElementAttribute(_t, "x"),
                                 PEd_xmlGetElementAttribute(_t, "y"),
                                 PEd_xmlGetElementAttribute(_t, "depth"));
                           
        tile_set_scale(_id,
                       PEd_xmlGetElementAttribute(_t, "scaleX"),
                       PEd_xmlGetElementAttribute(_t, "scaleY"));
    
        var _argb = PEd_xmlGetElementAttribute(_t, "colour");
        tile_set_blend(_id, PEd_argbToColour(_argb));
        tile_set_alpha(_id, PEd_argbToAlpha(_argb));
    }
    else
    {
        show_error("Could not create tile from '" + _bgName + "'. Background was not found.", false);
    }
}

PEd_xmlDestroyElement(_root);
return _room;
