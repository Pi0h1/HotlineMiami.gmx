/// PEd_guiDrawColourInput(x, y, width, colour, alpha)
/**
 * @brief Draws a colour input at the given position.
 * @param {real} x      The x position to draw the input at.
 * @param {real} y      The y position to draw the input at.
 * @param {real} width  The width of the input.
 * @param {real} colour The current colour.
 * @param {real} alpha  The current alpha.
 * @return {real} The id of a colour picker on click or noone.
 */
var _delegate = guiShapeFilling;
var _x = argument0;
var _xStart = _x;
var _y = argument1;
var _yStart = _y;
var _width = argument2;
var _colour = argument3;
var _alpha = argument4;
var _mouseOver = (PEd_guiShapeIsHovered(_delegate)
                  && guiMouseX > _x
                  && guiMouseY > _y
                  && guiMouseX < _x + _width
                  && guiMouseY < _y + guiInputSpriteHeight);

draw_sprite_ext(PEd_guiSprInput, 0, _x, _y, 1, 1, 0, _colour, 1);
var _w = round((_width - guiInputSpriteWidth * 2) * 0.5);
draw_sprite_stretched_ext(PEd_guiSprInput, 1, _x + guiInputSpriteWidth, _y, _w, guiInputSpriteHeight, _colour, 1);
draw_sprite_stretched_ext(PEd_guiSprInput, 1, _x + guiInputSpriteWidth + _w, _y, _w, guiInputSpriteHeight, c_black, 1);
draw_sprite_stretched_ext(PEd_guiSprInput, 1, _x + guiInputSpriteWidth + _w, _y, _w, guiInputSpriteHeight, c_white, _alpha);
draw_sprite_ext(PEd_guiSprInput, 2, _x + guiInputSpriteWidth + _w * 2, _y, 1, 1, 0, c_black, 1);
draw_sprite_ext(PEd_guiSprInput, 2, _x + guiInputSpriteWidth + _w * 2, _y, 1, 1, 0, c_white, _alpha);

if (mouse_check_button_pressed(mb_left)
    && _mouseOver)
{
    var _colourPicker = PEd_guiCreateWindow("Colour Picker");
    PEd_guiShapeSetPosition(_colourPicker,
        round((windowWidth - PEd_guiShapeGetWidth(_colourPicker)) * 0.5),
        round((windowHeight - PEd_guiShapeGetHeight(_colourPicker)) * 0.5));
    var _colourPickerContainer = PEd_guiWindowGetContainer(_colourPicker);
    _colourPickerContainer[? "colour"] = argument3;
    _colourPickerContainer[? "alpha"] = argument4;
    PEd_guiWindowSetContent(_colourPicker, PEd_guiContentColourPicker);
    PEd_guiAddItem(guiRoot, _colourPicker); 
    return _colourPicker;
}
return noone;
