/// PEd_vec2Scale(vector, real)
/**
 * @brief Scales the vector by the value.
 * @param {vec2} vector The vector.
 * @param {real}    real   The value to scale the vector by.
 * @return {vec2} The scaled vector.
 */
gml_pragma("forceinline");
return PEd_vec2(argument0[0] * argument1,
                argument0[1] * argument1);
