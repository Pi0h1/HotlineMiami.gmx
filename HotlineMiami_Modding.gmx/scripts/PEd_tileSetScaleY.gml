/// PEd_tileSetScaleY(tile, val)
/**
 * @brief Sets the y scale of the tile.
 * @param {real} tile The id of the tile.
 * @param {real} val  The new y scale of the tile.
 * @note If the tile is currently selected, this y scale
 *       is set to all tiles in multiple selection.
 */
with (PEd_oEditor)
{
    var _scale = argument1;
    var _tile = argument0;
    tile_set_scale(_tile, tile_get_xscale(_tile), _scale);
    
    if (PEd_getSelectedObject() == _tile)
    {
        for (var i = ds_list_size(selectedObjects) - 1; i > 0; i--) 
        {
            var _tile = selectedObjects[| i];
            tile_set_scale(_tile, tile_get_xscale(_tile), _scale);
        } 
    }
}
