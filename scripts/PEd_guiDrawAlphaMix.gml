/// PEd_guiDrawAlphaMix(x, y, alpha)
/**
 * @brief Draws an alpha mix at the given position.
 * @param {real} x     The x position to draw the alpha mix at.
 * @param {real} y     The y position to draw the alpha mix at.
 * @param {real} alpha The alpha value to mix.
 * @return {real} The new mixed alpha.
 */
var _container = guiShapeFilling;
var _containerWidth = PEd_guiShapeGetWidth(_container);
var _x = argument0;
var _y = argument1;
var _alpha = argument2;

// Check whether the sliders can be edited
var _edit = (mouse_check_button(mb_left)
             && PEd_guiShapeIsHovered(_container)
             && guiDnDObject == -1
             && pedDnDInstance == noone
             && guiDnDBackground == -1
             && editNow == -1
             && guiInputActive == noone);

// Alpha
var _sliderWidth = _containerWidth - _x * 2;
PEd_guiDrawRectangle(_x, _y, _sliderWidth, guiLineHeight, PEdColour.Input);
PEd_guiDrawRectangle(_x, _y, _sliderWidth * _alpha, guiLineHeight, merge_colour(c_black, c_white, _alpha));

if (_edit) 
{
    if (guiMouseX >= _x - 2
        && guiMouseY > _y
        && guiMouseX <= _x + _sliderWidth + 2
        && guiMouseY < _y + guiLineHeight) 
    {
        _alpha = max(0, min((guiMouseX - _x) / (_containerWidth - _x * 2), 1));
    }
}
_y += guiLineHeight + 4;

// Inputs
iw = round(_containerWidth - _x * 2);
var _input = PEd_guiDrawInput(_x, _y, iw, _alpha, false);
if (!is_undefined(_input)) 
{
    _alpha = max(0, min(_input, 1));
}

// Return alpha
return _alpha;
