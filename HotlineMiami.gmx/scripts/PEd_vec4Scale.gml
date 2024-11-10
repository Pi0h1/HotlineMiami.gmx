/// PEd_vec4Scale(vector, real)
/**
 * @brief Scales the vector by the value.
 * @param {vec4} vector The vector.
 * @param {real} real   The value to scale the vector by.
 * @return {vec4} The scaled vector.
 */
gml_pragma("forceinline");
return PEd_vec4(argument0[0] * argument1,
                argument0[1] * argument1,
                argument0[2] * argument1,
                argument0[3] * argument1);
