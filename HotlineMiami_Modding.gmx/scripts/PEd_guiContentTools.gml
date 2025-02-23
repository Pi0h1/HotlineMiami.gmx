/// PEd_guiContentTools(container)
/**
 * @brief Draws the content of a Tools to the container.
 * @param {real} container The id of the container.
 * @return {vec2} The content size.
 */
var _container = argument0;
var _containerWidth = PEd_guiShapeGetWidth(_container);
var _containerHeight = PEd_guiShapeGetHeight(_container);
var _contentX = round(guiLineHeight * 0.75);
var _contentY = 0;
var __contentX = _contentX;       

////////////////////////////////////////////////////////////////////////////////
// Left column
if (is_undefined(_container[? "columnLeftWidth"]))
{
    _container[? "columnLeftWidth"] = 70;
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

PEd_guiDrawRectangle(0, _scrollY, _columnLeftX, _containerHeight, PEdColour.WindowBackground2);

////////////////////////////////////////////////////////////////////////////////
//
// Tiles
//

// Draw section
if (PEd_guiDrawSection("Tiles", _contentX, _contentY, toolsTileEditorShow)) 
{
    toolsTileEditorShow = !toolsTileEditorShow;
}
_contentY += guiLineHeight;
    
var _backgroundWidth = 1;

if (toolsTileEditorShow) 
{
    _contentY += 4;
    var _textOffsetY = round((guiLineHeight - guiFontHeight) * 0.5);
    
    ////////////////////////////////////////////////////////////////////////////
    // Background
    PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Image", _columnLeftWidth);
    _contentX += _columnLeftWidth + 4;
    
    _backgroundWidth = background_get_width(tileBground) * tileZoom;
    var _backgroundHeight = background_get_height(tileBground) * tileZoom;
    
    var _mouseInArea = (PEd_guiShapeIsHovered(_container)
                        && guiMouseX > _contentX
                        && guiMouseY > _contentY
                        && guiMouseX < _contentX + _backgroundWidth
                        && guiMouseY < _contentY + _backgroundHeight);
    // Zoom
    if (_mouseInArea) 
    {
        var _wheel = mouse_wheel_up() - mouse_wheel_down();
        if (_wheel == 0) 
        {
            _wheel = (keyboard_check(vk_pageup) - keyboard_check(vk_pagedown)) * 0.25;
        }
        else if (keyboard_check(vk_control)) 
        {
            tileZoom = clamp(tileZoom + _wheel * 0.25, 0.25, 10);    
        }
    }
    
    PEd_guiDrawRectangle(_contentX, _contentY, _backgroundWidth, _backgroundHeight, c_black);
    draw_background_ext(tileBground, _contentX, _contentY, tileZoom, tileZoom, 0, tileColour, tileAlpha);
    
    // Selected part
    var rx = _contentX + tilePartX * tileZoom;
    var ry = _contentY + tilePartY * tileZoom;
    var rw = rx + tilePartW * tileZoom;
    var rh = ry + tilePartH * tileZoom;
    
    var _x0 = max(_contentX, min(rx, _contentX + _backgroundWidth)) - 1;
    var _x1 = max(_contentX, min(rw, _contentX + _backgroundWidth));
    var _y0 = max(_contentY, min(ry, _contentY + _backgroundHeight)) - 1;
    var _y1 = max(_contentY, min(rh, _contentY + _backgroundHeight));
    
    draw_rectangle_colour(min(_x0, _x1), min(_y0, _y1),
                          max(_x0, _x1), max(_y0, _y1),
                          0, 0, 0, 0, true);
    
    draw_rectangle(min(_x0, _x1), min(_y0, _y1),
                   max(_x0, _x1), max(_y0, _y1), true);
    
    // If mouse is in area
    if (_mouseInArea) 
    {
        // Visualisation of selection
        var tileVisX, tileVisY, tileVisW, tileVisH;
        tileVisX = floor((guiMouseX - _contentX - tileOffX * tileZoom) / ((tileGridW + tileStepX) * tileZoom)) * ((tileGridW + tileStepX) * tileZoom) + tileOffX * tileZoom;
        tileVisY = floor((guiMouseY - _contentY - tileOffY * tileZoom) / ((tileGridH + tileStepY) * tileZoom)) * ((tileGridH + tileStepY) * tileZoom) + tileOffY * tileZoom;
        tileVisX = max(tileOffX * tileZoom, tileVisX);
        tileVisY = max(tileOffY * tileZoom, tileVisY);
        tileVisW = tileGridW * tileZoom;
        tileVisH = tileGridH * tileZoom;
        
        rx = _contentX + tileVisX;
        ry = _contentY + tileVisY;
        rw = rx+tileVisW;
        rh = ry+tileVisH;
        
        draw_rectangle_colour(max(_contentX, min(rx, _contentX + _backgroundWidth)),
                              max(_contentY, min(ry, _contentY + _backgroundHeight)), 
                              max(_contentX, min(rw, _contentX + _backgroundWidth)) - 1,
                              max(_contentY, min(rh, _contentY + _backgroundHeight)) - 1,
                              PEdColour.Active, PEdColour.Active, PEdColour.Active, PEdColour.Active, true);
    
        // Set background
        if (guiDnDBackground != -1) 
        {
            if (mouse_check_button_released(mb_left)) 
            {
                tileBground = guiDnDBackground;
                guiDnDBackground = -1;
                
                tilePartX = 0;
                tilePartY = 0;
                tileGridW = clamp(tileGridW, 1, _backgroundWidth);
                tileGridH = clamp(tileGridH, 1, _backgroundHeight);
                tilePartW = tileGridW;
                tilePartH = tileGridH;
            }
        }
        else 
        {
            // Scroll
            if (mouse_check_button_pressed(mb_left)) 
            {
                // Selection
                tilePartX = tileVisX / tileZoom;
                tilePartY = tileVisY / tileZoom;
                tilePartW = tileVisW / tileZoom;
                tilePartH = tileVisH / tileZoom;
            }
            else if (mouse_check_button(mb_left)
                && keyboard_check(vk_shift)) 
            {
                tilePartW = (tileVisX + tileVisW) / tileZoom - tilePartX;
                tilePartH = (tileVisY + tileVisH) / tileZoom - tilePartY;
                if (tilePartW <= 0) 
                {
                    tilePartW -= tileVisW / tileZoom;
                }
                if (tilePartH <= 0) 
                {
                    tilePartH -= tileVisH / tileZoom;
                }
            }
            else if (mouse_check_button_released(mb_left)) 
            {
                if (tilePartW < 0) 
                {
                    tilePartX += tilePartW;
                    tilePartW = -tilePartW;
                }
                if (tilePartH < 0) 
                {
                    tilePartY += tilePartH;
                    tilePartH = -tilePartH;
                }
            }
        }
    }
    
    // Highlight area
    if (guiDnDBackground != -1) 
    {
        PEd_guiDrawRectangle(_contentX, _contentY, _backgroundWidth, _backgroundHeight, PEdColour.Active, 0.5);
    }
    
    _contentX = __contentX;
    _contentY += _backgroundHeight + 4;
    
    ////////////////////////////////////////////////////////////////////////////
    // Grid size
    PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Grid size", _columnLeftWidth);
    
    var _max = max(_containerWidth, _columnLeftX + 4 + _backgroundWidth);
    var _singleInputWidth = _max - _contentX - _columnLeftWidth - 12;
    var _inputWidth = round((_singleInputWidth - 4) * 0.5);
    var _inputX = _contentX + _columnLeftWidth + 4;
    
    var _input = PEd_guiDrawInput(_inputX, _contentY, _inputWidth, tileGridW);
    if (!is_undefined(_input)) 
    {
        tileGridW = clamp(round(_input), 1, _backgroundWidth);
    }
    
    var _input = PEd_guiDrawInput(_inputX + _inputWidth + 4, _contentY, _inputWidth, tileGridH);
    if (!is_undefined(_input)) 
    {
        tileGridH = clamp(round(_input), 1, _backgroundHeight);
    }
    _contentY += guiLineHeight + 4;
    
    // Offset
    PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Offset", _columnLeftWidth);
    
    var _input = PEd_guiDrawInput(_inputX, _contentY, _inputWidth, tileOffX);
    if (!is_undefined(_input)) 
    {
        tileOffX = max(round(_input), 0);
    }
    
    var _input = PEd_guiDrawInput(_inputX + _inputWidth + 4, _contentY, _inputWidth, tileOffY);
    if (!is_undefined(_input)) 
    {
        tileOffY = max(round(_input), 0);
    }
    _contentY += guiLineHeight + 4;
    
    // Step
    PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Step", _columnLeftWidth);
    
    var _input = PEd_guiDrawInput(_inputX, _contentY, _inputWidth, tileStepX);
    if (!is_undefined(_input)) 
    {
        tileStepX = max(0, round(_input));
    }
    
    var _input = PEd_guiDrawInput(_inputX + _inputWidth + 4, _contentY, _inputWidth, tileStepY);
    if (!is_undefined(_input)) 
    {
        tileStepY = max(0, round(_input));
    }
    _contentY += guiLineHeight + 4;
    
    // Colour
    PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Colour", _columnLeftWidth);
    var _colourPicker = PEd_guiDrawColourInput(_inputX, _contentY, _singleInputWidth, tileColour, tileAlpha);
    if (PEd_guiShapeExists(_colourPicker))
    {
        if (!PEd_guiShapeExists(guiColourPickerTileEditor))
        {
            guiColourPickerTileEditor = _colourPicker;
            var _titleBar = _colourPicker[? "titleBar"];
            _titleBar[? "title"] += " - Tile Editor";
        }
        else
        {
            PEd_guiDestroyShape(_colourPicker);
        }
    }
    _contentY += guiLineHeight + 4;
    
    // Depth
    PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Depth", _columnLeftWidth);
    var _input = PEd_guiDrawInput(_inputX, _contentY, _singleInputWidth, tileDepth);
    if (!is_undefined(_input)) 
    {
        tileDepth = round(_input);
        if (ds_list_find_index(tileLayers, tileDepth) == -1) 
        {
            ds_list_add(tileLayers, tileDepth);
            ds_list_add(tileVisible, true);
            tileLayerSelected = ds_list_size(tileLayers)-1;
        }
        else 
        {
            tileLayerSelected = ds_list_find_index(tileLayers, tileDepth);
        }
        PEd_guiRequestRedrawAll(guiRoot)
    }
    _contentY += guiLineHeight + 4;
    
    // Delete underlying
    PEd_guiDrawTextPart(_contentX, _contentY + _textOffsetY, "Delete underlying", _columnLeftWidth);
    tileDeleteUnderlying = PEd_guiDrawCheckbox(_inputX, _contentY, tileDeleteUnderlying);
    _contentY += guiLineHeight + 4;
}

return PEd_vec2(max(_containerWidth, _columnLeftX + 4 + _backgroundWidth), _contentY);
