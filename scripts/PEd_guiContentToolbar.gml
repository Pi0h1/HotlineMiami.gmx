/// PEd_guiContentToolbar(container)
/**
 * @brief Draws the content of a Toolbar to the container.
 * @param {real} container The id of the container.
 * @return {vec2} The content size.
 */
var _items = PEd_guiCompoundShapeGetItems(argument0);
var _padding = 1;
var _x = _padding;
var _y = _padding;

for (var i = 0; i < ds_list_size(_items); i++)
{
    var _item = _items[| i];
    PEd_guiDrawItem(_item, _x, _y);
    _x += PEd_guiShapeGetWidth(_item);
}

return PEd_vec2(_x + _padding, PEd_guiShapeGetHeight(argument0));
