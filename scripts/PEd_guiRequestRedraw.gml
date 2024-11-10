/// PEd_guiRequestRedraw(shape)
/**
 * @brief Pushes a redraw request of the given shape to the delegate.
 * @param {real} shape The id of the shape to redraw.
 */
var _shape = argument0;
while (PEd_guiShapeExists(_shape))
{
    PEd_guiShapeSetRedraw(_shape, true);
    _shape = PEd_guiShapeGetDelegate(_shape);
}
