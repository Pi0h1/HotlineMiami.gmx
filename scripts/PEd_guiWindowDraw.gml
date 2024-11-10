/// PEd_guiWindowDraw(window)
/**
 * @brief Draws the window.
 * @param {real} window The id of the window.
 */
var _window = argument0;
var _windowW = PEd_guiShapeGetWidth(_window);
var _windowH = PEd_guiShapeGetHeight(_window);
var _border = _window[? "border"];
var _titleBar = PEd_guiWindowGetTitleBar(_window);
var _container = PEd_guiWindowGetContainer(_window);

PEd_guiMatrixPush(PEd_guiShapeGetX(_window), PEd_guiShapeGetY(_window));

// Shadow and border
PEd_guiDrawShadow(0, 0, _windowW, _windowH, PEdColour.Shadow, PEdColour.ShadowAlpha);
var _selectedShape = PEd_guiGetSelectedShape();
var _colourBorder = PEdColour.WindowBorder;
if (_selectedShape == _window
    || PEd_guiShapeDelegatesRecursive(_window, _selectedShape))
{
    _colourBorder = PEdColour.Active;
}
PEd_guiDrawRectangle(0, 0, _windowW, _windowH, _colourBorder);

// Title
PEd_guiShapeSetWidth(_titleBar, _windowW - _border * 2);
PEd_guiDrawItem(_titleBar, _border, 0);
var _titleBarHeight = PEd_guiContainerGetContentHeight(_titleBar);
PEd_guiShapeSetHeight(_titleBar, _titleBarHeight);

// Content
PEd_guiShapeSetSize(_container,
    _windowW - _border * 2,
    max(_windowH - _titleBarHeight - _border, 1));
PEd_guiDrawItem(_container, _border, _titleBarHeight);

PEd_guiMatrixRestore();

PEd_guiShapeSetHeight(_window, max(PEd_guiShapeGetHeight(_window), _titleBarHeight + _border));
