/// PEd_guiWindowUpdate(window)
/**
 * @brief Updates the window.
 * @param {real} window The id of the window.
 */
var _window = argument0;
var _width = PEd_guiShapeGetWidth(_window);
var _height = PEd_guiShapeGetHeight(_window);
var _border = _window[? "border"];
var _titleBar = PEd_guiWindowGetTitleBar(_window);
var _resize = _window[? "resize"];

PEd_guiCompoundShapeUpdate(_window);

if (mouse_check_button_pressed(mb_any)
    && (PEd_guiShapeIsHovered(_window)
    || PEd_guiShapeDelegatesRecursive(_window, guiShapeHovered)))
{
    PEd_guiMoveItemToTop(_window);
    
    ////////////////////////////////////////////////////////////////////////////
    // FIXME Stupid hack :(
    guiShapeSelected = _window;
    PEd_guiRequestRedrawAll(guiRoot);
    ////////////////////////////////////////////////////////////////////////////
}

var _titleBarHoveredForResize = (PEd_guiShapeIsHovered(_titleBar)
                                && guiMouseY < _border);

if (PEd_guiShapeIsHovered(_titleBar)
    && !_titleBarHoveredForResize)
{
    // Start dragging
    if (mouse_check_button_pressed(mb_left)
        && guiMouseX < _width - guiLineHeight - _border)
    {
        _window[? "drag"] = true;
        _window[? "mouseOffsetX"] = PEd_guiShapeGetX(_window) - windowMouseX;
        _window[? "mouseOffsetY"] = PEd_guiShapeGetY(_window) - windowMouseY;
        guiShapeActive = _window;
    }
}
else if ((PEd_guiShapeIsHovered(_window)
    || _titleBarHoveredForResize)
    && _resize == PEdGUIResize.None)
{
    // Start resizing
    if (guiMouseX < _border)
    {
        _resize |= PEdGUIResize.Left;
    }
    else if (guiMouseX > _width - _border)
    {
        _resize |= PEdGUIResize.Right;
    }
    
    if (guiMouseY < _border)
    {
        _resize |= PEdGUIResize.Top;
    }
    else if (guiMouseY > _height - _border)
    {
        _resize |= PEdGUIResize.Bottom;
    }
    
    if (mouse_check_button_pressed(mb_left))
    {
        if (_resize & PEdGUIResize.Left)
        {
            _window[? "mouseOffsetX"] = windowMouseX - PEd_guiShapeGetX(_window);
        }
        else if (_resize & PEdGUIResize.Right)
        {
            _window[? "mouseOffsetX"] = PEd_guiShapeGetX(_window) + PEd_guiShapeGetWidth(_window) - windowMouseX;
        }
        
        if (_resize & PEdGUIResize.Top)
        {
            _window[? "mouseOffsetY"] = windowMouseY - PEd_guiShapeGetY(_window);
        }
        else if (_resize & PEdGUIResize.Bottom)
        {
            _window[? "mouseOffsetY"] = PEd_guiShapeGetY(_window) + PEd_guiShapeGetHeight(_window) - windowMouseY;
        }
    
        _window[? "resize"] = _resize;
        guiShapeActive = _window;
    }
}

if (_window[? "drag"])
{
    ////////////////////////////////////////////////////////////////////////////
    // Dragging
    PEd_guiShapeSetPosition(_window,
        clamp(windowMouseX, 0, windowWidth) + _window[? "mouseOffsetX"],
        clamp(windowMouseY, 0, windowHeight) + _window[? "mouseOffsetY"]);
    if (!mouse_check_button(mb_left))
    {
        _window[? "drag"] = false;
        guiShapeActive = noone;
    }
}

if (_resize != PEdGUIResize.None)
{
    ////////////////////////////////////////////////////////////////////////////
    // Resizing
    
    // Set cursor
    if ((_resize & PEdGUIResize.Left
        && _resize & PEdGUIResize.Top)
        || (_resize & PEdGUIResize.Right
        && _resize & PEdGUIResize.Bottom))
    {
        guiCursor = cr_size_nwse;
    }
    else if ((_resize & PEdGUIResize.Left
        && _resize & PEdGUIResize.Bottom)
        || (_resize & PEdGUIResize.Right
        && _resize & PEdGUIResize.Top))
    {
        guiCursor = cr_size_nesw;
    }
    else if (_resize & PEdGUIResize.Horizontal)
    {
        guiCursor = cr_size_we;
    }
    else if (_resize & PEdGUIResize.Vertical)
    {
        guiCursor = cr_size_ns;
    }
    
    // Set size
    if (guiShapeActive == _window)
    {
        var _minWidth = 128 + _border * 2;
        if (_resize & PEdGUIResize.Right)
        {
            PEd_guiShapeSetWidth(_window, max(guiMouseX + _window[? "mouseOffsetX"], _minWidth));
        }
        else if (_resize & PEdGUIResize.Left)
        {
            var _widthOld = PEd_guiShapeGetWidth(_window);
            var _widthNew = max(_widthOld - guiMouseX + _window[? "mouseOffsetX"], _minWidth);
            PEd_guiShapeSetWidth(_window, _widthNew);
            PEd_guiShapeSetX(_window, PEd_guiShapeGetX(_window) - (_widthNew - _widthOld));
        }
        
        var _minHeight = PEd_guiShapeGetHeight(_titleBar) + _border * 2;
        if (_resize & PEdGUIResize.Bottom)
        {
            PEd_guiShapeSetHeight(_window, max(guiMouseY + _window[? "mouseOffsetY"], _minHeight));
        }  
        else if (_resize & PEdGUIResize.Top)
        {
            var _heightOld = PEd_guiShapeGetHeight(_window);
            var _heightNew = max(_heightOld - guiMouseY + _window[? "mouseOffsetY"], _minHeight)
            PEd_guiShapeSetHeight(_window, _heightNew);
            PEd_guiShapeSetY(_window, PEd_guiShapeGetY(_window) - (_heightNew - _heightOld));
        }
         
        if (!mouse_check_button(mb_left))
        {
            _window[? "resize"] = PEdGUIResize.None;
            guiShapeActive = noone;
        }
    }
}
