/// PEd_guiShapeCleanUp(shape)
/**
 * @brief Frees resources used by the shape from memory.
 * @param {real} shape The id of the shape.
 */
var _shape = argument0;
if (PEd_guiShapeExists(_shape))
{
    // Remove from delegate
    var _delegate = PEd_guiShapeGetDelegate(_shape);
    if (PEd_guiShapeExists(_delegate))
    {
        var _items = PEd_guiCompoundShapeGetItems(_delegate);
        var _pos = ds_list_find_index(_items, _shape);
        if (_pos >= 0)
        {
            ds_list_delete(_items, _pos);
        }
    }
    
    // Destroy self
    ds_map_destroy(_shape);
}
