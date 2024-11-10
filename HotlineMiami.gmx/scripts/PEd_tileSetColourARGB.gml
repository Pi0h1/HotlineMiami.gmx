/// PEd_tileSetColourARGB(tile, val)
/**
 * @brief Sets the blend color of the tile.
 * @param {real} tile The id of the tile.
 * @param {real} val  The new blend color of the tile.
 * @note If the tile is currently selected, this blend color
 *       is set to all tiles in multiple selection.
 */
with (PEd_oEditor)
{
    var _colour = PEd_argbToColour(argument1);
    var _alpha = PEd_argbToAlpha(argument1);
    tile_set_blend(argument0, _colour);
    tile_set_alpha(argument0, _alpha);
                        
    if (PEd_getSelectedObject() == argument0)
    {
        for (var i = ds_list_size(selectedObjects) - 1; i > 0; i--) 
        {
            var _tile = selectedObjects[| i];
            tile_set_blend(_tile, _colour);
            tile_set_alpha(_tile, _alpha);
        }
    }
}
