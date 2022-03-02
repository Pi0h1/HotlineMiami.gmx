/// PEd_tileSetPosX(tile, val)
/**
 * @brief Sets the x position of the tile.
 * @param {real} tile The id of the tile.
 * @param {real} val  The new x position of the tile.
 * @note If the tile is currently selected, all tiles in
 *       multiple selection are moved accordingly.
 */
with (PEd_oEditor)
{
    var _tile = argument0;
    if (PEd_getSelectedObject() == _tile)
    {
        var _data = selectedObjectsData[| 0];
        PEd_oPivot.x = argument1 - _data[0];
    }
    else
    {
        tile_set_position(_tile, argument1, tile_get_y(_tile));
    }
}
