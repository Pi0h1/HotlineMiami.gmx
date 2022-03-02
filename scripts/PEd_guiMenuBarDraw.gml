/// PEd_guiMenuBarDraw(menuBar)
/**
 * @brief Draws the menu bar.
 * @param {real} menuBar The id of the menu bar.
 */
var _menu = argument0;
if (PEd_guiBeginFill(_menu))
{
    var _x = 0;
    var _y = 0;
    var _items = PEd_guiCompoundShapeGetItems(_menu);
    var _size = ds_list_size(_items);
    
    for (var i = 0; i < _size; i++)
    {
        var _item = _items[| i];
        PEd_guiDrawItem(_item, _x, _y);
        _x += PEd_guiShapeGetWidth(_item);
    }
    
    PEd_guiEndFill(_menu);
}

PEd_guiCanvasDraw(_menu);
