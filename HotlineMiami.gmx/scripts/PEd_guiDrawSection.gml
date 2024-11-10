/// PEd_guiDrawSection(name, x, y, expanded)
/**
 * @brief Draws a section at the given position.
 * @param {string} name     The name of the section.
 * @param {real}   x        The x position to draw the section at.
 * @param {real}   y        The y position to draw the section at.
 * @param {bool}   expanded True if the section is expanded.
 * @return {bool} True if the section is clicked.
 */
var _container = guiShapeFilling;
var _containerWidth = PEd_guiShapeGetWidth(_container);
var _text = string(argument0);
var _x = argument1;
var _y = argument2;
var _state = argument3;

// Background
PEd_guiDrawRectangle(0, _y, _containerWidth, guiLineHeight, PEdColour.Section);

// Text
draw_set_font(PEd_fntBold);
draw_text(guiLineHeight, _y + round((guiLineHeight - guiFontHeight) * 0.5), _text);
draw_set_font(PEd_fntNormal);

// Icon
draw_sprite(PEd_guiSprRoll, _state, 8, _y);

// Mouse over
if (PEd_guiShapeIsHovered(_container)
    && guiMouseY > _y
    && guiMouseY < _y + guiLineHeight) 
{
    // Click
    if (mouse_check_button_pressed(mb_left)) 
    {
        PEd_guiRequestRedraw(_container);
        return true;
    }
}
return false;
