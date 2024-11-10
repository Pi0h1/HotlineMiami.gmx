/// PEd_instanceAddRotZ(id, rot)
/**
 * @brief Rotates instance around the z axis by the given angle.
 * @param {real} id  The id of the instance.
 * @param {real} rot The angle.
 */
var _id = argument0;
var _rot = argument1;

if (global.pedUsing3D) 
{
    var _matWorld = matrix_get(matrix_world);
    
    matrix_set(matrix_world,
        matrix_build(0, 0, 0,
                     PEd_instanceGetRotX(_id),
                     PEd_instanceGetRotY(_id),
                     PEd_instanceGetRotZ(_id),
                     1, 1, 1));
    d3d_transform_add_rotation_z(_rot);
    
    // Save new rotation angles
    var _euler = PEd_matrixRotToEuler(matrix_get(matrix_world));
    PEd_instanceSetRotX(_id, _euler[0]);
    PEd_instanceSetRotY(_id, _euler[1]);
    PEd_instanceSetRotZ(_id, _euler[2]);
    
    matrix_set(matrix_world, _matWorld);
}
else 
{
    PEd_instanceSetRotZ(_id, PEd_instanceGetRotZ(_id) + _rot);
}

// Position
var _dist = point_distance(PEd_oPivot.x, PEd_oPivot.y, PEd_instanceGetPosX(_id), PEd_instanceGetPosY(_id));
var _dir = point_direction(PEd_oPivot.x, PEd_oPivot.y, PEd_instanceGetPosX(_id), PEd_instanceGetPosY(_id));
PEd_instanceSetPosX(_id, PEd_oPivot.x + lengthdir_x(_dist, _dir + _rot), false);
PEd_instanceSetPosY(_id, PEd_oPivot.y + lengthdir_y(_dist, _dir + _rot), false);
with (PEd_oEditor)
{
    var _index = ds_list_find_index(selectedObjects, _id);
    if (_index != -1)
    {
        var _data = selectedObjectsData[| _index]; 
        _data[@ 0] = PEd_instanceGetPosX(_id) - PEd_oPivot.x;
        _data[@ 1] = PEd_instanceGetPosY(_id) - PEd_oPivot.y;
    }
}
