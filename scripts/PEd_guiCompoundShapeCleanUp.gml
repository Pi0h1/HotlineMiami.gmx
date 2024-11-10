/// PEd_guiCompoundShapeCleanUp(compoundShape)
/**
 * @brief Frees resources used by the compound shape from memory.
 * @param {real} compoundShape The id of the compound shape.
 */
var _items = PEd_guiCompoundShapeGetItems(argument0);
while (ds_list_size(_items) > 0)
{
    var _item = _items[| 0];
    var _scrCleanUp = _item[? "scrCleanUp"];
    if (_scrCleanUp != noone)
    {
        script_execute(_scrCleanUp, _item);
    }
}
PEd_guiShapeCleanUp(argument0);
