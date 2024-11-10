/// PEd_guiShapeGetTooltip(shape)
/**
 * @brief Gets the tooltip of the shape.
 * @param {real} shape The id of the shape.
 * @return {string} The shape tooltip or an empty string if it does not have any.
 */
var _tooltip = argument0[? "tooltip"];
if (is_undefined(_tooltip))
{
    return "";
}
return _tooltip;
