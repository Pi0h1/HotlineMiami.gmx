/// PEd_savePivotOffsets()
/**
 * @brief Stores pivot offsets from all selected objects.
 */
var _size = ds_list_size(selectedObjects);
if (_size > 0)
{
    if (PEd_getSelectedObject() <= 0)
    {
        return 0;
    }

    ds_list_clear(selectedObjectsData);
    PEd_oPivot.x = 0;
    PEd_oPivot.y = 0;
    PEd_oPivot.z = 0; 

    switch (editMode)
    {
    ////////////////////////////////////////////////////////////////////////////
    // Objects
    case 0:
        // Acumulate pivot position
        for (var i = 0; i < _size; i++)
        {
            var _inst = selectedObjects[| i];
            PEd_oPivot.x += PEd_instanceGetPosX(_inst);
            PEd_oPivot.y += PEd_instanceGetPosY(_inst);
            if (global.pedUsing3D)
            {
                PEd_oPivot.z += PEd_instanceGetPosZ(_inst);
            }
        }
        
        // Center pivot position
        PEd_oPivot.x /= _size;
        PEd_oPivot.y /= _size;
        PEd_oPivot.z /= _size;
        
        // Save offsets
        for (var i = 0; i < _size; i++) 
        {
            var _inst = selectedObjects[| i];
            var _offsetZ = 0;
            if (global.pedUsing3D)
            {
                _offsetZ = PEd_instanceGetPosZ(_inst) - PEd_oPivot.z;
            }
            ds_list_add(selectedObjectsData,
                        PEd_vec3(PEd_instanceGetPosX(_inst) - PEd_oPivot.x,
                                 PEd_instanceGetPosY(_inst) - PEd_oPivot.y,
                                 _offsetZ));
        }
        break;
            
    ////////////////////////////////////////////////////////////////////////////
    // Tiles
    case 1:
        // Acumulate pivot position
        for (var i = 0; i < _size; i++)
        {
            var _inst = selectedObjects[| i];
            PEd_oPivot.x += tile_get_x(_inst);
            PEd_oPivot.y += tile_get_y(_inst);
        }
        
        // Center pivot position
        PEd_oPivot.x /= _size;
        PEd_oPivot.y /= _size;
        
        // Save offsets
        for (var i = 0; i < _size; i++) 
        {
            var _inst = selectedObjects[| i];
            var _offset = PEd_vec3(tile_get_x(_inst) - PEd_oPivot.x,
                                   tile_get_y(_inst) - PEd_oPivot.y,
                                   0);
            ds_list_add(selectedObjectsData, _offset);
        }
        break;
    }
}
