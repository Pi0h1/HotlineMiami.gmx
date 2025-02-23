/// PEd_guiMoveItemToTop(item)
/**
 * @brief Moves the item to the top while preserving depth order.
 * @param {real} item The id of the item to move.
 */
var _item = argument0;
var _delegate = PEd_guiShapeGetDelegate(_item);

if (!PEd_guiShapeExists(_delegate))
{
    exit;
}

var _items = PEd_guiCompoundShapeGetItems(_delegate);
var _n = ds_list_size(_items);
var _index = ds_list_find_index(_items, _item);

if (_index >= 0)
{
    var i = _index + 1;
    var _itemDepth = PEd_guiShapeGetDepth(_item);
    
    while (i < _n && PEd_guiShapeGetDepth(_items[| i]) <= _itemDepth)
    {
        ++i;
    }
    
    PEd_dsListInsertMap(_items, i, _item);
    ds_list_delete(_items, _index);
}
