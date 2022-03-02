/// PEd_guiFindShape(items, x, y)
/**
 * @brief Recursively finds shape on the given position in the list of shapes.
 * @param {real} items The list of shapes.
 * @param {real} x     The x position to find a shape at.
 * @param {real} y     The y position to find a shape at.
 * @return {real} The id of the found shape or noone.
 */
var _items = argument0;
var _mouseX = argument1;
var _mouseY = argument2;

for (var i = ds_list_size(_items) - 1; i >= 0; i--)
{
    var _item = _items[| i];
    var _x = PEd_guiShapeGetX(_item);
    var _y = PEd_guiShapeGetY(_item);
    
    if (_mouseX > _x
        && _mouseY > _y
        && _mouseX < _x + PEd_guiShapeGetWidth(_item)
        && _mouseY < _y + PEd_guiShapeGetHeight(_item))
    {
        PEd_guiShapeSetRedraw(_item, true);
    
        // Skip hidden scrollbars
        if (PEd_guiShapeGetType(_item) == PEdGUIShape.Scrollbar
            && !PEd_guiScrollbarIsVisible(_item))
        {
            continue;
        }
        
        // Check if scrollbars are hovered
        var _scrollX = 0;
        var _scrollY = 0;
        var _scrollbarHor = _item[? "scrollbarHor"]
        var _scrollbarVer = _item[? "scrollbarVer"];
        var _scrollbars = ds_list_create();
        
        if (!is_undefined(_scrollbarHor))
        {
            ds_list_add(_scrollbars, _scrollbarHor);
            _scrollX = PEd_guiScrollbarGetScroll(_scrollbarHor) * PEd_guiScrollbarIsVisible(_scrollbarHor);
        }
        if (!is_undefined(_scrollbarVer))
        {
            ds_list_add(_scrollbars, _scrollbarVer);
            _scrollY = PEd_guiScrollbarGetScroll(_scrollbarVer) * PEd_guiScrollbarIsVisible(_scrollbarVer);
        }
        
        var _hovered = noone;
        if (!ds_list_empty(_scrollbars))
        {
            _hovered = PEd_guiFindShape(_scrollbars, _mouseX - _x + _scrollX, _mouseY - _y + _scrollY);
        }
        ds_list_destroy(_scrollbars);
        if (PEd_guiShapeExists(_hovered))
        {
            return _hovered;
        }
    
        // Find hovered item
        var _subItems = PEd_guiCompoundShapeGetItems(_item);
        if (!is_undefined(_subItems))
        {
            var _hovered = PEd_guiFindShape(_subItems, _mouseX - _x + _scrollX, _mouseY - _y + _scrollY);
            if (PEd_guiShapeExists(_hovered))
            {
                return _hovered;
            }
        }
        
        return _item;
    }
}
return noone;
