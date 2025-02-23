/// PEd_guiAddItem(compoundShape, item)
/**
 * @brief Adds item to the compound shape while preserving depth order.
 * @param {real} compoundShape The id of the compound shape.
 * @param {real} item          The id of the item to be added.
 * @return {real} The index where the item has been placed at.
 */
var _items = PEd_guiCompoundShapeGetItems(argument0);
var _index = ds_list_size(_items);
while (_index > 0)
{
    if (PEd_guiShapeGetDepth(_items[| _index - 1]) > PEd_guiShapeGetDepth(argument1))
    {
        _index--;
    }
    else
    {
        break;
    }
}
PEd_dsListInsertMap(_items, _index, argument1);
PEd_guiShapeSetDelegate(argument1, argument0);
return _index;
