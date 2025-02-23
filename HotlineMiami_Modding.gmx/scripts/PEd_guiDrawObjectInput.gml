/// PEd_guiDrawObjectInput(x, y, width, object)
/**
 * @brief Draws a D&D input for an object.
 * @param {real} x          The x position to draw the input at.
 * @param {real} y          The y position to draw the input at.
 * @param {real} width      The width of the input.
 * @param {real} background The current object.
 * @return {real} The new object or -1.
 */
var _delegate = guiShapeFilling;
var _x = argument0;
var _y = argument1;
var _width = argument2;
var _object = argument3;
var _mouseOver = (PEd_guiShapeIsHovered(_delegate)
                  && guiMouseX > _x
                  && guiMouseY > _y
                  && guiMouseX < _x + _width
                  && guiMouseY < _y + guiLineHeight);

PEd_guiDrawInput(_x, _y, _width, object_get_name(_object), true);
    
if (guiDnDObject != -1) 
{
    PEd_guiDrawRectangle(_x, _y, _width, guiLineHeight, PEdColour.Active, 0.5);
}

draw_sprite(PEd_guiSprMisc, 3, _x + _width - 20, _y);

if (_mouseOver)
{
    guiTooltip = "Drag and drop object here from the Content Browser.";
    
    if (mouse_check_button_released(mb_left)
        && guiDnDObject != -1) 
    {
        var _temp = guiDnDObject;
        guiDnDObject = -1;
        return _temp;
    }
    
    if (guiMouseX > _x + _width - 20) 
    {
        guiTooltip = "Remove object.";
        if (mouse_check_button_pressed(mb_left))
        {
            return -1;
        }
    }
}
return _object;
