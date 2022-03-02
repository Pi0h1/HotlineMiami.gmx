/// PEd_instanceGetPosVec3(id)
/**
 * @brief Gets the instance position on the x,y,z axis.
 * @param {real} id The id of the instance.
 * @return {vec3} The position on the x,y,z axis.
 */
with (argument0)
{
    var _x = variable_instance_get(id, PEd_POS_X);
    var _y = variable_instance_get(id, PEd_POS_Y);
    var _z = variable_instance_get(id, PEd_POS_Z);
    return PEd_vec3(_x, _y, _z);
}
