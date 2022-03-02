/// PEd_tileSetPosY(tile, val)
/**
 * @brief Sets the y position of the tile.
 * @param {real} tile The id of the tile.
 * @param {real} val  The new y position of the tile.
 * @note If the tile is currently selected, all tiles in
 *       multiple selection are moved accordingly.
 */
with (PEd_oEditor)
{
    var _tile = argument0;
    if (PEd_getSelectedObject() == _tile)
    {
        var _data = selectedObjectsData[| 0];
        PEd_oPivot.y = argument1 - _data[1];
    }
    else
    {
        tile_set_position(_tile, tile_get_x(_tile), argument1);
    }
}
