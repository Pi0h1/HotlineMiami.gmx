/// PEd_vec2Abs(vector)
/**
 * @brief Sets the vectors components to their absolute value.
 * @param {vec2} vector The vector.
 * @return {vec2} The vectors with its components set to their absolute values.
 */
gml_pragma("forceinline");
return PEd_vec2(abs(argument0[0]),
                abs(argument0[1]),);
