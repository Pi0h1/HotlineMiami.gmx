/// PEd_guiCompoundShapeUpdate(compoundShape)
/**
 * @brief Updates the compound shape.
 * @param {real} compoundShape The id of the compound shape.
 */
PEd_guiShapeUpdate(argument0);

////////////////////////////////////////////////////////////////////////////////
// Update items
var _items = PEd_guiCompoundShapeGetItems(argument0);
for (var i = ds_list_size(_items) - 1; i >= 0; i--)
{
    var _item = _items[| i];
    if (!PEd_guiShapeExists(_item))
    {
        ds_list_delete(_items, i);
    }
}
