/// PEd_guiContentDetails(container)
/**
 * @brief Draws the content of a Details to the container.
 * @param {real} container The id of the container.
 * @return {vec2} The content size.
 */
var _container = argument0;
var _containerWidth = PEd_guiShapeGetWidth(_container);
var _containerHeight = PEd_guiShapeGetHeight(_container);

var _contentX = round(guiLineHeight * 0.75);
var _contentY = 0;
var __contentY = _contentY;
var __contentX = _contentX;

////////////////////////////////////////////////////////////////////////////////
// Left column
if (is_undefined(_container[? "columnLeftWidth"]))
{
    _container[? "columnLeftWidth"] = 100;
    _container[? "columnLeftResize"] = false;
}

var _columnLeftWidth = _container[? "columnLeftWidth"];
var _columnLeftResize = _container[? "columnLeftResize"];
var _columnLeftX = _contentX + _columnLeftWidth;
var _mouseOverColumnLeftResizeArea = (PEd_guiShapeIsHovered(_container)
                                      && guiMouseX > _columnLeftX - 4
                                      && guiMouseX < _columnLeftX + 4);

var _scrollY = 0;
var _scrollbarVer = _container[? "scrollbarVer"];
if (!is_undefined(_scrollbarVer))
{
    _scrollY = PEd_guiScrollbarGetScroll(_scrollbarVer) * PEd_guiScrollbarIsVisible(_scrollbarVer);
}                             

if (_mouseOverColumnLeftResizeArea)
{
    guiCursor = cr_size_we;
    if (mouse_check_button_pressed(mb_left))
    {
        // Start resizing
        guiShapeActive = _container;
        _container[? "columnLeftResize"] = true;
    }
}

if (guiShapeActive == _container
    && _container[? "columnLeftResize"])
{
    // Set new size
    guiCursor = cr_size_we;
    _columnLeftWidth = guiMouseX - _contentX;
    _container[? "columnLeftWidth"] = _columnLeftWidth;
    if (mouse_check_button_released(mb_left))
    {
        // End resizing
        guiShapeActive = noone;
        _container[? "columnLeftResize"] = false;
    }
}

// Clamp size
_columnLeftWidth = clamp(_columnLeftWidth, 32, _containerWidth - _contentX * 2 - 32);
_container[? "columnLeftWidth"] = _columnLeftWidth;

var _inputW = _containerWidth - _contentX - _columnLeftWidth - 4 - 8;
var _singleInputWidth = _inputW;
var _textOffsetY = round((guiLineHeight - guiFontHeight) * 0.5);

var _selectedObj = PEd_getSelectedObject();
if (_selectedObj > 0)
{
    PEd_guiDrawRectangle(0, _scrollY, _columnLeftX, _containerHeight, PEdColour.WindowBackground2);

    ////////////////////////////////////////////////////////////////////////////
    // Draw custom data
    var _textOffsetY = floor((guiLineHeight - guiFontHeight) * 0.5);
    
    for (var i = 0; i < ds_list_size(customData); i++)
    {
        // Get custom data container
        var _container = customData[| i];
        var _name = _container[| 0];
        var _expanded = _container[| 1];
        
        if (PEd_guiDrawSection(_name, _contentX, _contentY, _expanded))
        {
            _expanded = !_expanded;
            _container[| 1] = _expanded; // Save state
        }
        _contentY += guiLineHeight;
    
        if (_expanded)
        {
            _contentY += 4;
        
            var _drawOnSingleLine = 0;
            
            for (var j = 2; j < ds_list_size(_container); j += 4)
            {
                // Get metadata
                var _dataType = _container[| j];
                var _dataName = _container[| j + 1];
                var _dataGetter = _container[| j + 2];
                var _dataSetter = noone;
                var _dataValue = "";
                
                if (_drawOnSingleLine == 0)
                {
                    if (_dataType == PEdDataTypes.Vector2)
                    {
                        __contentY = _contentY;
                        _drawOnSingleLine = 2;
                        _inputW = (_singleInputWidth - 4 * (_drawOnSingleLine - 1)) / _drawOnSingleLine;
                    }
                    else if (_dataType == PEdDataTypes.Vector3)
                    {
                        __contentY = _contentY;
                        _drawOnSingleLine = 3;
                        _inputW = (_singleInputWidth - 4 * (_drawOnSingleLine - 1)) / _drawOnSingleLine;
                    }
                }
                
                if (_dataGetter != noone)
                {
                    _dataValue = script_execute(_dataGetter, _selectedObj);
                    
                    // If the data does not have a getter that we don't need
                    // to get the setter.
                    _dataSetter = _container[| j + 3];
                }
                
                // Draw data name
                PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, _dataName, _columnLeftWidth);
                
                // Draw input and get new value
                var _inputX = _contentX + _columnLeftWidth + 4;
                var _input = undefined;
                var _inputH = guiLineHeight;
                
                switch (_dataType)
                {
                    case PEdDataTypes.Colour:
                        var _colourInputColour = PEd_argbToColour(_dataValue);
                        var _colourInputAlpha = PEd_argbToAlpha(_dataValue);
                        var _colourPicker = PEd_guiDrawColourInput(_inputX, _contentY, _inputW, _colourInputColour, _colourInputAlpha);
                        if (_colourPicker != noone)
                        {
                            if (!PEd_guiShapeExists(guiColourPickerObject))
                            {
                                guiColourPickerObject = _colourPicker;
                                var _titleBar = _colourPicker[? "titleBar"];
                                 _titleBar[? "title"] += " - Instance/Tile";
                            }
                            else
                            {
                                PEd_guiDestroyShape(_colourPicker);
                            }
                        }
                        break;
                        
                    case PEdDataTypes.Bool:
                        _input = PEd_guiDrawCheckbox(_inputX, _contentY, _dataValue);
                        break;
                        
                    case PEdDataTypes.Background:
                        _input = PEd_guiDrawBackgroundInput(_inputX, _contentY, _inputW, _dataValue);
                        break;
                        
                    case PEdDataTypes.Object:
                        _input = PEd_guiDrawObjectInput(_inputX, _contentY, _inputW, _dataValue);
                        break;
                        
                    default:
                        _input = PEd_guiDrawInput(_inputX, _contentY, _inputW, _dataValue, _dataSetter == noone);
                        break;
                }
                    
                // Set new value
                if (!is_undefined(_input)
                    && _dataSetter != noone) 
                {
                    script_execute(_dataSetter, _selectedObj, _input);
                }
                
                if (_drawOnSingleLine > 1)
                {
                    _contentY = __contentY;
                }
                
                if (_drawOnSingleLine > 0)
                {
                    _drawOnSingleLine--;
                    _contentX += _inputW + 4;
                }
                
                if (_drawOnSingleLine == 0)
                {
                    _contentY += _inputH + 4;
                    _contentX = __contentX;
                    _inputW = _singleInputWidth;
                }
            }
        }
    }
} // _selectedObj > 0
else if (_selectedObj < 0)
{
    PEd_guiDrawRectangle(0, _scrollY, _columnLeftX, _containerHeight, PEdColour.WindowBackground2);
    
    var _room = PEd_getCurrentRoom();
    var _inputX = _contentX + _columnLeftWidth + 4;

    ////////////////////////////////////////////////////////////////////////////
    //
    // Room
    //
    
    // Draw section
    if (PEd_guiDrawSection("Room", _contentX, _contentY, detailsRoomShow)) 
    {
        detailsRoomShow = !detailsRoomShow;
    }
    _contentY += guiLineHeight;
    
    // Draw room section
    if (detailsRoomShow) 
    {
        _contentY += 4;    
    
        ////////////////////////////////////////////////////////////////////////
        //
        // Room properties
        //
        
        // Room name
        var _name = PEd_roomGetName(_room);
        PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Name", _columnLeftWidth);
        var _input = PEd_guiDrawInput(_inputX, _contentY, _singleInputWidth, _name, false);
        if (!is_undefined(_input)) 
        {
            PEd_roomSetName(_room, _input);
            if (_input != _name)
            {
                PEd_guiRequestRedrawAll(guiRoot)
                pedFileSave = "";
            }
        }
        _contentY += guiLineHeight + 4;
        
        // Room caption
        PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Caption", _columnLeftWidth);
        var _input = PEd_guiDrawInput(_inputX, _contentY, _inputW, PEd_roomGetCaption(_room));
        if (!is_undefined(_input)) 
        {
            PEd_roomSetCaption(_room, _input);
        }
        _contentY += guiLineHeight + 4;
        
        // Room creation code
        PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Creation code", _columnLeftWidth);
        var _input = PEd_guiDrawInput(_inputX, _contentY, _inputW, PEd_roomGetCode(_room));
        if (!is_undefined(_input)) 
        {
            PEd_roomSetCode(_room, _input);
        }
        _contentY += guiLineHeight + 4;
        
        // Room speed
        PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Speed", _columnLeftWidth);
        var _input = PEd_guiDrawInput(_inputX, _contentY, _inputW, PEd_roomGetSpeed(_room));
        if (!is_undefined(_input)) 
        {
            PEd_roomSetSpeed(_room, floor(_input));
        }
        _contentY += guiLineHeight + 4;
        
        // Persistent
        PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Persistent", _columnLeftWidth);
        PEd_roomSetPersistent(_room,
            PEd_guiDrawCheckbox(_inputX, _contentY, PEd_roomGetPersistent(_room)));
        _contentY += guiLineHeight + 4;
        
        // Room dimensions
        PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Size", _columnLeftWidth);
        _inputW = floor((_singleInputWidth - 4) * 0.5);
        var _input = PEd_guiDrawInput(_inputX, _contentY, _inputW, PEd_roomGetWidth(_room));
        if (!is_undefined(_input)) 
        {
            PEd_roomSetWidth(_room, max(1, _input));
        }
        var _input = PEd_guiDrawInput(_inputX + _inputW + 4, _contentY, _inputW, PEd_roomGetHeight(_room));
        if (!is_undefined(_input)) 
        {
            PEd_roomSetHeight(_room, max(1, _input));
        }
        _contentY += guiLineHeight + 4;
        
        // Grid size
        PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Grid size", _columnLeftWidth);
        _inputW = floor((_singleInputWidth - 8) / 3);
        var _input = PEd_guiDrawInput(_inputX, _contentY, _inputW, PEd_roomGetSnapH(_room));
        if (!is_undefined(_input)) 
        {
            PEd_roomSetSnapH(_room, max(1, _input));
        }
        var _input = PEd_guiDrawInput(_inputX + _inputW + 4, _contentY, _inputW, PEd_roomGetSnapV(_room));
        if (!is_undefined(_input)) 
        {
            PEd_roomSetSnapV(_room, max(1, _input));
        }
        var _input = PEd_guiDrawInput(_inputX + _inputW * 2 + 8, _contentY, _inputW, PEd_roomGetSnapD(_room));
        if (!is_undefined(_input)) 
        {
            PEd_roomSetSnapD(_room, max(1, _input));
        }
        _contentY += guiLineHeight + 4;
        
        // Colour
        PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Colour", _columnLeftWidth);
        var _colourPicker = PEd_guiDrawColourInput(_inputX, _contentY, _singleInputWidth, PEd_roomGetColour(_room), 1);
        if (PEd_guiShapeExists(_colourPicker))
        {
            if (!PEd_guiShapeExists(guiColourPickerRoom))
            {
                guiColourPickerRoom = _colourPicker;
                var _titleBar = _colourPicker[? "titleBar"];
                _titleBar[? "title"] += " - Room";
            }
            else
            {
                PEd_guiDestroyShape(_colourPicker);
            }
        }
        _contentY += guiLineHeight + 4;
        
        // Show colour
        PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Show colour", _columnLeftWidth);
        PEd_roomSetShowColour(_room,
            PEd_guiDrawCheckbox(_inputX, _contentY, PEd_roomGetShowColour(_room)));
        _contentY += guiLineHeight + 4;
    }
    
    ////////////////////////////////////////////////////////////////////////////
    //
    // Background
    //
     
    // Draw section
    if (PEd_guiDrawSection("Backgrounds", _contentX, _contentY, detailsRoomBackgroundShow)) 
    {
        detailsRoomBackgroundShow = !detailsRoomBackgroundShow;
    }
    _contentY += guiLineHeight;
        
    if (detailsRoomBackgroundShow) 
    {
        _contentY += 4;
        
        for (var i = 0; i < 8; i++) 
        {
            if (PEd_guiDrawListItem("Background" + string(i), _contentX, _contentY, detailsEditBackground == i, 0)) 
            {
                detailsEditBackground = i;
            }
            _contentY += guiLineHeight;
        }
        _contentY += 4;
        
        var _background = PEd_roomGetBackground(_room, detailsEditBackground);
        
        // Visible when room starts
        PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Visible", _columnLeftWidth);
        PEd_backgroundSetVisible(_background,
            PEd_guiDrawCheckbox(_inputX, _contentY, PEd_backgroundGetVisible(_background)));
        _contentY += guiLineHeight + 4;
        
        // Is foreground
        PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Is foreground", _columnLeftWidth);
        PEd_backgroundSetAsForeground(_background,
            PEd_guiDrawCheckbox(_inputX, _contentY, PEd_backgroundIsForeground(_background)));
        _contentY += guiLineHeight + 4;
        
        // Background image
        PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Image", _singleInputWidth);
        PEd_backgroundSetImage(_background,
            PEd_guiDrawBackgroundInput(_inputX, _contentY, _singleInputWidth, PEd_backgroundGetImage(_background)));
        _contentY += guiLineHeight + 4;
        
        // Background position
        PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Position", _columnLeftWidth);
        _inputW = floor((_singleInputWidth - 4) * 0.5);

        var _input = PEd_guiDrawInput(_inputX, _contentY, _inputW, PEd_backgroundGetX(_background))
        if (!is_undefined(_input)) 
        {
            PEd_backgroundSetX(_background, floor(_input));
        }
        var _input = PEd_guiDrawInput(_inputX + _inputW + 4, _contentY, _inputW, PEd_backgroundGetY(_background))
        if (!is_undefined(_input)) 
        {
            PEd_backgroundSetY(_background, floor(_input));
        }
        _contentY += guiLineHeight + 4;
        
        // Tile
        PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Tile horizontally", _columnLeftWidth);
        var _bool = PEd_backgroundGetTiledHor(_background);
        var _checkbox = PEd_guiDrawCheckbox(_inputX, _contentY, _bool);
        if (_checkbox != _bool) 
        {
            PEd_backgroundSetTiledHor(_background, _checkbox);
            if (!_checkbox)
            {
                PEd_backgroundSetStretch(_background, false);
            }
        }
        _contentY += guiLineHeight + 4;
        
        PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Tile vertically", _columnLeftWidth);
        var _bool = PEd_backgroundGetTiledVer(_background);
        var _checkbox = PEd_guiDrawCheckbox(_inputX, _contentY, _bool);
        if (_checkbox != _bool) 
        {
            PEd_backgroundSetTiledVer(_background, _checkbox);
            if (!_checkbox)
            {
                PEd_backgroundSetStretch(_background, false);
            }
        }
        _contentY += guiLineHeight + 4;
        
        // Stretch
        PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Stretch", _columnLeftWidth);
        var _bool = PEd_backgroundGetStretch(_background);
        var _checkbox = PEd_guiDrawCheckbox(_inputX, _contentY, _bool);
        if (_checkbox != _bool)
        {
            PEd_backgroundSetStretch(_background, _checkbox);
            if (!_checkbox) 
            {
                PEd_backgroundSetTiledHor(_background, false);
                PEd_backgroundSetTiledVer(_background, false);
            }
        }
        _contentY += guiLineHeight + 4;
        
        // Speed
        _inputW = floor((_singleInputWidth - 4) * 0.5);
        PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Speed", _columnLeftWidth);
        var _input = PEd_guiDrawInput(_inputX, _contentY, _inputW, PEd_backgroundGetSpeedHor(_background));
        if (!is_undefined(_input)) 
        {
            PEd_backgroundSetSpeedHor(_background, floor(_input));
        }
        var _input = PEd_guiDrawInput(_inputX + _inputW + 8, _contentY, _inputW, PEd_backgroundGetSpeedVer(_background));
        if (!is_undefined(_input)) 
        {
            PEd_backgroundSetSpeedVer(_background, floor(_input));
        }
        _contentY += guiLineHeight + 4;
        
    }
    
    ////////////////////////////////////////////////////////////////////////////
    //
    // Views
    //
     
    // Draw section
    if (PEd_guiDrawSection("Views", _contentX, _contentY, detailsViewShow)) 
    {
        detailsViewShow = !detailsViewShow;
    }
    _contentY += guiLineHeight;
    
    // View list
    if (detailsViewShow) 
    {
        _contentY += 4;
        for (var i = 0; i < 8; i++) 
        {
            if (PEd_guiDrawListItem("View" + string(i), _contentX, _contentY, detailsEditView == i, 0)) 
            {
                detailsEditView = i;
            }
            _contentY += guiLineHeight;
        }
        _contentY += 4;
        
        var _viewport = PEd_roomGetViewport(_room, detailsEditView);
        
        // Settings
        _inputW = floor((_singleInputWidth - 4) * 0.5);
        
        // View
        PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "View position", _columnLeftWidth);
        var _input = PEd_guiDrawInput(_inputX, _contentY, _inputW, PEd_viewportGetX(_viewport));
        if (!is_undefined(_input)) 
        {
            PEd_viewportSetX(_viewport, floor(_input));
        }
        var _input = PEd_guiDrawInput(_inputX + _inputW + 4, _contentY, _inputW, PEd_viewportGetY(_viewport));
        if (!is_undefined(_input)) 
        {
            PEd_viewportSetY(_viewport, floor(_input));
        }
        _contentY += guiLineHeight + 4;
        
        PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "View size", _columnLeftWidth);
        var _input = PEd_guiDrawInput(_inputX, _contentY, _inputW, PEd_viewportGetWidth(_viewport));
        if (!is_undefined(_input)) 
        {
            PEd_viewportSetWidth(_viewport, floor(_input));
        }
        var _input = PEd_guiDrawInput(_inputX + _inputW + 4, _contentY, _inputW, PEd_viewportGetHeight(_viewport));
        if (!is_undefined(_input)) 
        {
            PEd_viewportSetHeight(_viewport, floor(_input));
        }
        _contentY += guiLineHeight + 4;
        
        // Port on screen
        PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Port position", _columnLeftWidth);
        var _input = PEd_guiDrawInput(_inputX, _contentY, _inputW, PEd_viewportGetPortX(_viewport));
        if (!is_undefined(_input)) 
        {
            PEd_viewportSetPortX(_viewport, floor(_input));
        }
        var _input = PEd_guiDrawInput(_inputX + _inputW + 4, _contentY, _inputW, PEd_viewportGetPortY(_viewport));
        if (!is_undefined(_input)) 
        {
            PEd_viewportSetPortY(_viewport, floor(_input));
        }
        _contentY += guiLineHeight + 4;
        
        PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Port size", _columnLeftWidth);
        var _input = PEd_guiDrawInput(_inputX, _contentY, _inputW, PEd_viewportGetPortWidth(_viewport));
        if (!is_undefined(_input)) 
        {
            PEd_viewportSetPortWidth(_viewport, floor(_input));
        }
        var _input = PEd_guiDrawInput(_inputX + _inputW + 4, _contentY, _inputW, PEd_viewportGetPortHeight(_viewport));
        if (!is_undefined(_input)) 
        {
            PEd_viewportSetPortHeight(_viewport, floor(_input));
        }
        _contentY += guiLineHeight + 4;
        
        // Visible
        PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Visible", _columnLeftWidth);
        PEd_viewportSetVisible(_viewport,
            PEd_guiDrawCheckbox(_inputX, _contentY, PEd_viewportGetVisible(_viewport)));
        _contentY += guiLineHeight + 4;
        
        // Object following
        PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Object following", _columnLeftWidth);
        PEd_viewportSetObject(_viewport,
            PEd_guiDrawObjectInput(_inputX, _contentY, _singleInputWidth, PEd_viewportGetObject(_viewport)));
        _contentY += guiLineHeight + 4;
        
        // Border
        _inputW = floor((_singleInputWidth - 4)  * 0.5);
        
        PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Border", _columnLeftWidth);
        var _input = PEd_guiDrawInput(_inputX, _contentY, _inputW, PEd_viewportGetBorderHor(_viewport));
        if (!is_undefined(_input)) 
        {
            PEd_viewportSetBorderHor(_viewport, floor(_input));
        }
        var _input = PEd_guiDrawInput(_inputX + _inputW + 4, _contentY, _inputW, PEd_viewportGetBorderVer(_viewport));
        if (!is_undefined(_input)) 
        {
            PEd_viewportSetBorderVer(_viewport, floor(_input));
        }
        _contentY += guiLineHeight + 4;
        
        // Speed
        PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Speed", _columnLeftWidth);
        var _input = PEd_guiDrawInput(_inputX, _contentY, _inputW, PEd_viewportGetSpeedHor(_viewport));
        if (!is_undefined(_input)) 
        {
            PEd_viewportSetSpeedHor(_viewport, floor(_input));
        }
        var _input = PEd_guiDrawInput(_inputX + _inputW + 4, _contentY, _inputW, PEd_viewportGetSpeedVer(_viewport));
        if (!is_undefined(_input)) 
        {
            PEd_viewportSetSpeedVer(_viewport, floor(_input));
        }
        _contentY += guiLineHeight + 4;
    }
    
    ////////////////////////////////////////////////////////////////////////////
    //
    // Physics
    //
    
    // Draw section
    if (PEd_guiDrawSection("Physics", _contentX, _contentY, detailsPhysicsShow)) 
    {
        detailsPhysicsShow = !detailsPhysicsShow;
    }
    _contentY += guiLineHeight;
    
    if (detailsPhysicsShow) 
    {
        _contentY += 4;
        _inputW = floor((_containerWidth - _contentX * 2 - 4) * 0.5);
        
        var _physicsWorld = PEd_roomGetPhysicsWorld(_room);
        
        // Use physics
        PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Use physics", _columnLeftWidth);
        PEd_physicsWorldSetEnabled(_physicsWorld,
            PEd_guiDrawCheckbox(_inputX, _contentY, PEd_physicsWorldGetEnabled(_physicsWorld)));
        _contentY += guiLineHeight + 4;
        
        // Gravity
        PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Gravity", _columnLeftWidth);
        _inputW = floor((_singleInputWidth - 4) * 0.5);
        var _input = PEd_guiDrawInput(_inputX, _contentY, _inputW, PEd_physicsWorldGetGravityX(_physicsWorld));
        if (!is_undefined(_input)) 
        {
            PEd_physicsWorldSetGravityX(_physicsWorld, _input);
        }
        var _input = PEd_guiDrawInput(_inputX + _inputW + 4, _contentY, _inputW, PEd_physicsWorldGetGravityY(_physicsWorld));
        if (!is_undefined(_input)) 
        {
            PEd_physicsWorldSetGravityY(_physicsWorld, _input);
        }
        _contentY += guiLineHeight + 4;
        
        // Px to M
        PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Pixels to meter", _columnLeftWidth);
        var _input = PEd_guiDrawInput(_inputX, _contentY, _singleInputWidth, PEd_physicsWorldGetPxToM(_physicsWorld));
        if (!is_undefined(_input)) 
        {
            PEd_physicsWorldSetPxToM(_physicsWorld, _input);
        }
        _contentY += guiLineHeight + 4;
    }
} // _selectedObj < 0

return PEd_vec2(_containerWidth, _contentY);
