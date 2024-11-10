/// PEd_tileSetDepth(tile, depth)
/**
 * @brief Sets the depth of the tile.
 * @param {real} tile The id of the tile.
 * @param {real} val  The new depth of the tile.
 * @note If the tile is currently selected, this depth
 *       is set to all tiles in multiple selection.
 */
with (PEd_oEditor)
{
    var _depth = argument1;
    tile_set_depth(argument0, _depth);
    
    if (PEd_getSelectedObject() == argument0)
    {
        for (var i = ds_list_size(selectedObjects) - 1; i > 0; i--) 
        {
            tile_set_depth(selectedObjects[| i], _depth);
        } 
        
        if (ds_list_find_index(tileLayers, _depth) == -1) 
        {
            ds_list_add(tileLayers, _depth);
            ds_list_add(tileVisible, true);
            tileLayerSelected = ds_list_size(tileLayers) - 1;
            PEd_guiRequestRedrawAll(guiRoot)
        }
        else 
        {
            tileLayerSelected = ds_list_find_index(tileLayers, _depth);
        }
    }
}
