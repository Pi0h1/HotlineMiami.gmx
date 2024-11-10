/// PEd_instanceGetPosVec2(id)
/**
 * @brief Gets the instance position on the x,y axis.
 * @param {real} id The id of the instance.
 * @return {vec2} The position on the x,y axis.
 */
with (argument0)
{
    var _x = variable_instance_get(id, PEd_POS_X);
    var _y = variable_instance_get(id, PEd_POS_Y);
    return PEd_vec2(_x, _y);
}
