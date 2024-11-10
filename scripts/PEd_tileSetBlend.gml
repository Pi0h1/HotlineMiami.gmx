/// PEd_tileSetBlend(tile, val)
/**
 * @brief Sets the blend color of the tile.
 * @param {real} tile The id of the tile.
 * @param {real} val  The new blend color of the tile.
 * @note If the tile is currently selected, this blend color
 *       is set to all tiles in multiple selection.
 */
with (PEd_oEditor)
{
    tile_set_blend(argument0, argument1);
                        
    if (PEd_getSelectedObject() == argument0)
    {
        for (var i = ds_list_size(selectedObjects) - 1; i > 0; i--) 
        {
            var _tile = selectedObjects[| i];
            tile_set_blend(_tile, argument1);
        }
    }
}
