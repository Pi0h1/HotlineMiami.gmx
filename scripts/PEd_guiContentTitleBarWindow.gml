/// PEd_guiContentTitleBarWindow(container)
/**
 * @brief Draws the content of a Window Title Bar to the container.
 * @param {real} container The id of the container.
 * @return {vec2} The content size.
 */
var _container = argument0;
var _containerWidth = PEd_guiShapeGetWidth(_container);

var _delegate = PEd_guiShapeGetDelegate(_container);
var _selectedShape = PEd_guiGetSelectedShape();
if (_selectedShape == _delegate
    || PEd_guiShapeDelegatesRecursive(_delegate, _selectedShape))
{
    draw_clear(PEdColour.Active);
}

var _x = 4;
var _y = 4;
var _title = _container[? "title"];
PEd_guiDrawTextBold(_x, _y + round((guiLineHeight - guiFontHeight) * 0.5), _title);
if (PEd_guiDrawSpriteClickable(PEd_guiSprWindowCross, 0, _containerWidth - guiLineHeight, _y + 4, PEdColour.WindowButton))
{
    PEd_guiDestroyShape(_delegate);
}
_y += guiLineHeight + 4;

return PEd_vec2(_containerWidth, _y);
