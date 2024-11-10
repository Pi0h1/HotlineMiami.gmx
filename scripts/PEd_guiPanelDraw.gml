/// PEd_guiPanelDraw(panel)
/**
 * @brief Draws the panel.
 * @param {real} panel The id of the panel.
 */
var _panel = argument0;
var _panelW = PEd_guiShapeGetWidth(_panel);
var _panelH = PEd_guiShapeGetHeight(_panel);
var _titleBar = PEd_guiPanelGetTitleBar(_panel);
var _container = PEd_guiPanelGetContainer(_panel);

PEd_guiMatrixPush(PEd_guiShapeGetX(_panel), PEd_guiShapeGetY(_panel));

PEd_guiShapeSetWidth(_titleBar, _panelW);
PEd_guiDrawItem(_titleBar, 0, 0);
PEd_guiShapeSetHeight(_titleBar,
    clamp(PEd_guiContainerGetContentHeight(_titleBar), 1, _panelH - 1));

var _border = 1;
var _titleBarHeight = PEd_guiShapeGetHeight(_titleBar);
PEd_guiShapeSetSize(_container,
    _panelW - _border * 2,
    max(_panelH - _titleBarHeight - _border, 1));

var _selectedShape = PEd_guiGetSelectedShape();
var _colourBorder = PEdColour.WindowBorder;
if (_selectedShape == _panel
    || PEd_guiShapeDelegatesRecursive(_panel, _selectedShape))
{
    _colourBorder = PEdColour.Active;
}
PEd_guiDrawRectangle(0, _titleBarHeight, _panelW, _panelH - _titleBarHeight, _colourBorder);
PEd_guiDrawItem(_container, _border, _titleBarHeight);

PEd_guiMatrixRestore();
