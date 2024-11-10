/// PEd_instanceGetScaleVec2(id)
/**
 * @brief Gets the instance scale on the x,y axis.
 * @param {real} id The id of the instance.
 * @return {vec2} The scale on the x,y axis.
 */
return PEd_vec2(
    variable_instance_get(argument0, PEd_ROT_X),
    variable_instance_get(argument0, PEd_SCALE_Y));
