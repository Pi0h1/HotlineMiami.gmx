/// PEd_instanceAddRotX(id, rot)
/**
 * @brief Rotates instance around the x axis by the given angle.
 * @param {real} id  The id of the instance.
 * @param {real} rot The angle.
 */
var _id = argument0;
var _rot = argument1;
var _matWorld = matrix_get(matrix_world);

matrix_set(matrix_world,
    matrix_build(0, 0, 0,
                 PEd_instanceGetRotX(_id),
                 PEd_instanceGetRotY(_id),
                 PEd_instanceGetRotZ(_id),
                 1, 1, 1));
d3d_transform_add_rotation_x(_rot);

// Save new rotation angles
var _euler = PEd_matrixRotToEuler(matrix_get(matrix_world));
PEd_instanceSetRotX(_id, _euler[0]);
PEd_instanceSetRotY(_id, _euler[1]);
PEd_instanceSetRotZ(_id, _euler[2]);

matrix_set(matrix_world, _matWorld);

// Position
var _dist = point_distance(PEd_oPivot.y, PEd_oPivot.z, PEd_instanceGetPosY(_id), PEd_instanceGetPosZ(_id));
var _dir = point_direction(PEd_oPivot.y, PEd_oPivot.z, PEd_instanceGetPosY(_id), PEd_instanceGetPosZ(_id));
PEd_instanceSetPosY(_id, PEd_oPivot.y + lengthdir_x(_dist, _dir + _rot), false);
PEd_instanceSetPosZ(_id, PEd_oPivot.z + lengthdir_y(_dist, _dir + _rot), false);
with (PEd_oEditor)
{
    var _index = ds_list_find_index(selectedObjects, _id);
    if (_index != -1)
    {
        var _data = selectedObjectsData[| _index]; 
        _data[@ 1] = PEd_instanceGetPosY(_id) - PEd_oPivot.y;
        _data[@ 2] = PEd_instanceGetPosZ(_id) - PEd_oPivot.z;
    }
}
