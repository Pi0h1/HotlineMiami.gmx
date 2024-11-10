/// PEd_vec3Scale(vector, real)
/**
 * @brief Scales the vector by the value.
 * @param {vec3} vector The vector.
 * @param {real} real   The value to scale the vector by.
 * @return {vec3} The scaled vector.
 */
gml_pragma("forceinline");
return PEd_vec3(argument0[0] * argument1,
                argument0[1] * argument1,
                argument0[2] * argument1);
