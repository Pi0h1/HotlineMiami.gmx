/// PEd_actCopySelectedObjects()
/**
 * @brief Creates a copy of all selected objects.
 */
var _size = ds_list_size(selectedObjects);
if (_size > 0) 
{
    if (editMode == PEdEditModes.Object) 
    {
        var _instances = PEd_roomGetInstances(PEd_getCurrentRoom());
        for (var i = 0; i < _size; i++) 
        {
            var _copy = PEd_instanceCopy(selectedObjects[| i]);
            ds_list_add(_instances, _copy);
            ds_list_replace(selectedObjects, i, _copy);
        }
    }
    else if (editMode == PEdEditModes.Tile)
    {
        var _room = PEd_getCurrentRoom();
        var _tiles = PEd_roomGetTiles(_room);
        for (var i = 0; i < _size; i ++) 
        {
            var _tile = PEd_tileCopy(_room, selectedObjects[| i]);
            ds_list_add(_tiles, _tile);
            ds_list_replace(selectedObjects, i, _tile);
        }
    }
    PEd_guiRequestRedrawAll(guiRoot)
}
