/// PEd_guiDrawColourMix(x, y, colour)
/**
 * @brief Draws a colour mix at the given position.
 * @param {real} x      The x position to draw the colour mix at.
 * @param {real} y      The y position to draw the colour mix at.
 * @param {real} colour The colour to mix.
 * @return {real} The new mixed colour.
 */
var _x = argument0;
var _y = argument1;
var _colour = argument2;
var _container = guiShapeFilling;
var _containerWidth = PEd_guiShapeGetWidth(_container);
var _red = colour_get_red(_colour);
var _green = colour_get_green(_colour);
var _blue = colour_get_blue(_colour);

// Check whether the sliders can be edited
var _edit = (PEd_guiShapeIsHovered(_container)
             && guiDnDObject == -1
             && pedDnDInstance == noone
             && guiDnDBackground == -1
             && editNow == -1
             && guiInputActive == noone);

// Red
var _sliderWidth = _containerWidth - _x * 2;
PEd_guiDrawRectangle(_x, _y, _sliderWidth, guiLineHeight, PEdColour.Input);
PEd_guiDrawRectangle(_x, _y, _sliderWidth * (_red / 255), guiLineHeight, make_colour_rgb(_red, 0, 0));
if (_edit) 
{
    if (guiMouseX >= _x - 2
        && guiMouseY > _y
        && guiMouseX <= _x + _sliderWidth + 2
        && guiMouseY < _y + guiLineHeight) 
    {
        if (mouse_check_button(mb_left))
        {
            _red = round(clamp((guiMouseX - _x) / (_containerWidth - _x * 2), 0, 1) * 255);
        }
        colorShow = make_colour_rgb(_red, _green, _blue);
    }
}
_y  += guiLineHeight + 4;

// Green
PEd_guiDrawRectangle(_x, _y, _sliderWidth, guiLineHeight, PEdColour.Input);
PEd_guiDrawRectangle(_x, _y, _sliderWidth * (_green / 255), guiLineHeight, make_colour_rgb(0, _green, 0));
if (_edit) 
{
    if (guiMouseX >= _x - 2
        && guiMouseY > _y
        && guiMouseX <= _x + _sliderWidth + 2
        && guiMouseY < _y + guiLineHeight) 
    {
        if (mouse_check_button(mb_left))
        {
            _green = round(clamp((guiMouseX - _x) / (_containerWidth - _x * 2), 0, 1) * 255);
        }
        colorShow = make_colour_rgb(_red, _green, _blue);
    }
}
_y += guiLineHeight + 4;

// Blue
PEd_guiDrawRectangle(_x, _y, _sliderWidth, guiLineHeight, PEdColour.Input);
PEd_guiDrawRectangle(_x, _y, _sliderWidth * (_blue / 255), guiLineHeight, make_colour_rgb(0, 0, _blue));
if (_edit) 
{
    if (guiMouseX >= _x - 2
        && guiMouseY > _y
        && guiMouseX <= _x + _sliderWidth + 2
        && guiMouseY < _y + guiLineHeight) 
    {
        if (mouse_check_button(mb_left))
        {
            _blue = round(clamp((guiMouseX - _x) / (_containerWidth - _x * 2), 0, 1) * 255);
        }
        colorShow = make_colour_rgb(_red, _green, _blue);
    }
}
_y += guiLineHeight + 4;

// Inputs
var _input;
var _inputWidth = round((_sliderWidth - 16) / 3);

_input = PEd_guiDrawInput(_x, _y, _inputWidth, _red);
if (!is_undefined(_input)) 
{
    _red = clamp(round(_input), 0, 255);
}

_input = PEd_guiDrawInput(_x + _inputWidth + 8, _y, _inputWidth, _green);
if (!is_undefined(_input)) 
{
    _green = clamp(round(_input), 0, 255);
}

_input = PEd_guiDrawInput(_x + _inputWidth * 2 + 16, _y, _inputWidth, _blue);
if (!is_undefined(_input)) 
{
    _blue = clamp(round(_input), 0, 255);
}

return make_colour_rgb(_red, _green, _blue);
