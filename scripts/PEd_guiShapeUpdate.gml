/// PEd_guiShapeUpdate(shape)
/**
 * @brief Updates the shape.
 * @param {real} shape The id of the shape.
 */
var _shape = argument0;
//PEd_guiShapeSetSize(_shape, PEd_guiShapeGetWidth(_shape), PEd_guiShapeGetHeight(_shape));

// Set tooltip on mouse over
if (PEd_guiShapeIsHovered(_shape))
{
    guiTooltip = PEd_guiShapeGetTooltip(_shape);
    
    // Select shape
    if (mouse_check_button_pressed(mb_any))
    {
        var _exists = PEd_guiShapeExists(guiShapeSelected);
        if ((_exists && guiShapeSelected != _shape)
            || !_exists)
        {
            PEd_guiRequestRedrawAll(guiRoot);
        }
        guiShapeSelected = _shape;
    }
}
