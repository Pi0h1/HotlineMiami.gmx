/// PEd_guiShapeDelegatesRecursive(shape, item)
/**
 * @brief Finds out whether the shape delegates the item.
 * @param {real} shape The id of the shape.
 * @param {real} item The id of the shape.
 * @return {bool} True if the shape delegates the item.
 * @note If the shape is not the delegate of the item, this
 *       function is called recursively for the item's delegate,
 *       until the shape is found or the item does not have delegate.
 *       This way you can check for chained delegation. Wtf?!
 */
if (!PEd_guiShapeExists(argument1))
{
    return false;
}
var _delegate = PEd_guiShapeGetDelegate(argument1);
if (!PEd_guiShapeExists(_delegate))
{
    return false;
}
if (_delegate == argument0)
{
    return true;
}
return PEd_guiShapeDelegatesRecursive(argument0, _delegate);
