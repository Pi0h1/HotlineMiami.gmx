/// PEd_vec4Abs(vector)
/**
 * @brief Sets the vectors components to their absolute value.
 * @param {vec4} vector The vector.
 * @return {vec4} The vectors with its components set to their absolute values.
 */
gml_pragma("forceinline");
return PEd_vec4(abs(argument0[0]),
                abs(argument0[1]),
                abs(argument0[2]),
                abs(argument0[3]));
