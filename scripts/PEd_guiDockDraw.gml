/// PEd_guiDockDraw(dock)
/**
 * @brief Draws the dock.
 * @param {real} dock The id of the dock.
 */
var _dock = argument0;
var _x = PEd_guiShapeGetX(_dock);
var _y = PEd_guiShapeGetY(_dock);
var _items = PEd_guiCompoundShapeGetItems(_dock);
var _itemCount = ds_list_size(_items);

PEd_guiMatrixPush(_x, _y);
    
if (_itemCount == 1)
{
    var _item = _items[| 0];
    PEd_guiShapeSetSize(_item,
        PEd_guiShapeGetWidth(_dock),
        PEd_guiShapeGetHeight(_dock));
    PEd_guiDrawItem(_item, 0, 0);
}
else if (_itemCount == 2)
{
    var _width = PEd_guiShapeGetWidth(_dock);
    var _height = PEd_guiShapeGetHeight(_dock);
    var _splitType = _dock[? "splitType"];
    var _splitSize = _dock[? "splitSize"];
    var _padding = _dock[? "padding"];
    var _middle;
    
    if (_splitType == PEdGUISplit.Horizontal)
    {
        _middle = round(_width * _splitSize);
    }
    else
    {
        _middle = round(_height * _splitSize);
    }
    
    // Left
    var _left = _items[| 0];
    if (_splitType == PEdGUISplit.Horizontal)
    {
        PEd_guiShapeSetSize(_left,
            _middle - _padding,
            _height);
    }
    else
    {
        PEd_guiShapeSetSize(_left,
            _width,
            _middle - _padding);
    }
    PEd_guiDrawItem(_left, 0, 0);
    
    // Right
    var _right = _items[| 1];
    if (_splitType == PEdGUISplit.Horizontal)
    {
        PEd_guiShapeSetRectangle(_right,
            _middle + _padding,
            0,
            _width - _middle - _padding,
            _height);
    }
    else
    {
        PEd_guiShapeSetRectangle(_right,
            0,
            _middle + _padding,
            _width,
            _height - _middle - _padding);
    }
    PEd_guiDrawItem(_right);
}

PEd_guiMatrixRestore();
