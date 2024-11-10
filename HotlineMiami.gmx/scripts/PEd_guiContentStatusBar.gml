/// PEd_guiContentStatusBar(container)
/**
 * @brief Draws the content of a Status bar to the container.
 * @param {real} container The id of the container.
 * @return {vec2} The content size.
 */
var _container = argument0;
var _containerWidth = PEd_guiShapeGetWidth(_container);
var _containerHeight = PEd_guiShapeGetHeight(_container);
var _items = PEd_guiCompoundShapeGetItems(_container);
var _padding = 4;
var _x = _padding;
var _y = _padding;

var _textY = round((_containerHeight - guiFontHeight) * 0.5);
var _text;

var _inputWidth = 64;
var _inputWidthPlusPadding = _inputWidth + _padding;

var _input;

PEd_guiDrawRectangle(0, 0, _containerWidth, 1, PEdColour.WindowBorder);

////////////////////////////////////////////////////////////////////////////////
// Grid size
var _room = PEd_getCurrentRoom();

_text = "Grid size:";
draw_text(_x, _textY, _text);
_x += string_width(_text) + _padding;

_input = PEd_guiDrawInput(_x, _y, _inputWidth, PEd_roomGetSnapH(_room));
if (!is_undefined(_input))
    PEd_roomSetSnapH(_room, max(1, _input));
_x += _inputWidthPlusPadding;

_input = PEd_guiDrawInput(_x, _y, _inputWidth, PEd_roomGetSnapV(_room));
if (!is_undefined(_input))
    PEd_roomSetSnapV(_room, max(1, _input));
_x += _inputWidthPlusPadding;

_input = PEd_guiDrawInput(_x, _y, _inputWidth, PEd_roomGetSnapD(_room));
if (!is_undefined(_input))
    PEd_roomSetSnapD(_room, max(1, _input));
_x += _inputWidthPlusPadding;

////////////////////////////////////////////////////////////////////////////////
// Pivot position
_text = "Pivot:";
draw_text(_x, _textY, _text);
_x += string_width(_text) + _padding;

_input = PEd_guiDrawInput(_x, _y, _inputWidth, PEd_oPivot.x);
if (!is_undefined(_input))
    PEd_oPivot.x = _input;
_x += _inputWidthPlusPadding;

_input = PEd_guiDrawInput(_x, _y, _inputWidth, PEd_oPivot.y);
if (!is_undefined(_input))
    PEd_oPivot.y = _input;
_x += _inputWidthPlusPadding;

_input = PEd_guiDrawInput(_x, _y, _inputWidth, PEd_oPivot.z);
if (!is_undefined(_input))
    PEd_oPivot.z = _input;
_x += _inputWidthPlusPadding;

////////////////////////////////////////////////////////////////////////////////
// Camera
_text = "Camera:";
draw_text(_x, _textY, _text);
_x += string_width(_text) + _padding;

if (global.pedUsing3D)
{
    _input = PEd_guiDrawInput(_x, _y, _inputWidth, x);
    if (!is_undefined(_input))
        x = _input;
    _x += _inputWidthPlusPadding;
    
    _input = PEd_guiDrawInput(_x, _y, _inputWidth, y);
    if (!is_undefined(_input))
        y = _input;
    _x += _inputWidthPlusPadding;
    
    _input = PEd_guiDrawInput(_x, _y, _inputWidth, z);
    if (!is_undefined(_input))
        z = _input;
    _x += _inputWidthPlusPadding;
}
else
{
    _input = PEd_guiDrawInput(_x, _y, _inputWidth, view_xview[0]);
    if (!is_undefined(_input))
        view_xview[0] = _input;
    _x += _inputWidthPlusPadding;
    
    _input = PEd_guiDrawInput(_x, _y, _inputWidth, view_yview[0]);
    if (!is_undefined(_input))
        view_yview[0] = _input;
    _x += _inputWidthPlusPadding;
}

////////////////////////////////////////////////////////////////////////////////
// Camera speed
_text = "CamSpeed:";
draw_text(_x, _textY, _text);
_x += string_width(_text) + _padding;

_input = PEd_guiDrawInput(_x, _y, _inputWidth, camSpeed);
if (!is_undefined(_input))
    camSpeed = _input;
_x += _inputWidthPlusPadding;

return PEd_vec2(_x + _padding, _containerHeight);
