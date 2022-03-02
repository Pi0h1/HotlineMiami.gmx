/// PEd_guiPushMouseCoordinates(shape)
/**
 * @brief Pushes mouse coordinates to be relative to the shape.
 * @param {real} shape The id of the shape.
 */
var _shape = argument0;
var _x = PEd_guiShapeGetX(_shape);
var _y = PEd_guiShapeGetY(_shape);
var _scrollX = 0;
var _scrollY = 0;
var _scrollbarHor = _shape[? "scrollbarHor"]
var _scrollbarVer = _shape[? "scrollbarVer"];

if (!is_undefined(_scrollbarHor))
{
    _scrollX = PEd_guiScrollbarGetScroll(_scrollbarHor) * PEd_guiScrollbarIsVisible(_scrollbarHor);
}
if (!is_undefined(_scrollbarVer))
{
    _scrollY = PEd_guiScrollbarGetScroll(_scrollbarVer) * PEd_guiScrollbarIsVisible(_scrollbarVer);
}

guiMouseX += -_x + _scrollX;
guiMouseY += -_y + _scrollY;

var _delegate = PEd_guiShapeGetDelegate(_shape);
if (PEd_guiShapeExists(_delegate))
{
    PEd_guiPushMouseCoordinates(_delegate);
}
