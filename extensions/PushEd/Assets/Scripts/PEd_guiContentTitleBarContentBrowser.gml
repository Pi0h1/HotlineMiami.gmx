/// PEd_guiContentTitleBarContentBrowser(container)
/**
 * @brief Draws the content of a Content Browser Title Bar to the container.
 * @param {real} container The id of the container.
 * @return {vec2} The content size.
 */
var _container = argument0;
var _containerWidth = PEd_guiShapeGetWidth(_container);
var _containerHeight = PEd_guiShapeGetHeight(_container);

var _delegate = PEd_guiShapeGetDelegate(_container);
var _selectedShape = PEd_guiGetSelectedShape();
if (_selectedShape == _delegate
    || PEd_guiShapeDelegatesRecursive(_delegate, _selectedShape))
{
    // FIXME Ugly hack :(
    PEd_guiDrawRectangle(0, 0, _containerWidth, guiLineHeight + 8, PEdColour.Active);
    PEd_guiDrawRectangle(0, 0, 1, _containerHeight, PEdColour.Active);
    PEd_guiDrawRectangle(_containerWidth - 1, 0, 1, _containerHeight, PEdColour.Active);
}

var _x = 4;
var _y = 4;
var _title = _container[? "title"];
draw_sprite(PEd_guiSprPanel, 0, _x, _y);
PEd_guiDrawTextBold(_x + guiLineHeight + 4, _y + round((guiLineHeight - guiFontHeight) * 0.5), _title);
_y += guiLineHeight + 8;

var _inputWidth = _containerWidth - _x * 2;
var _input = PEd_guiDrawInput(_x, _y, _inputWidth, contentBrowserFilter, false, "Filter...");
if (!is_undefined(_input))
{
    contentBrowserFilter = _input;
    PEd_guiRequestRedrawAll(guiRoot)
}
_y += guiLineHeight + 4;

return PEd_vec2(_containerWidth, _y);
