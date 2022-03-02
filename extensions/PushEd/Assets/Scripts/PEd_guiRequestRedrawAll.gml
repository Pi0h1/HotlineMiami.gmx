/// PEd_guiRequestRedrawAll(shape)
/**
 * @brief Requests redraw of all child shapes.
 * @param {real} shape The id of the shape.
 */
PEd_guiShapeSetRedraw(argument0, true);
var _items = PEd_guiCompoundShapeGetItems(argument0);
if (!is_undefined(_items))
{
    for (var i = ds_list_size(_items) - 1; i >= 0; i--)
    {
        PEd_guiRequestRedrawAll(_items[| i]);
    }
}
