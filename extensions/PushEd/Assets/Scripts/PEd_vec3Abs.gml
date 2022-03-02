/// PEd_vec3Abs(vector)
/**
 * @brief Sets the vectors components to their absolute value.
 * @param {vec3} vector The vector.
 * @return {vec3} The vectors with its components set to their absolute values.
 */
gml_pragma("forceinline");
return PEd_vec3(abs(argument0[0]),
                abs(argument0[1]),
                abs(argument0[2]));
