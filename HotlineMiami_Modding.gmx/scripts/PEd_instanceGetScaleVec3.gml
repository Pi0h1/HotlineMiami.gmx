/// PEd_instanceGetScaleVec3(id)
/**
 * @brief Gets the instance scale on the x,y,z axis.
 * @param {real} id The id of the instance.
 * @return {vec3} The scale on the x,y,z axis.
 */
return PEd_vec2(
    variable_instance_get(argument0, PEd_SCALE_X),
    variable_instance_get(argument0, PEd_SCALE_Y));
