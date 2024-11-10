/// PEd_vec2Lerp(v1, v2, t)
/**
 * @brief Linearly interpolates between the two vectors.
 * @param {vec2} v1 The first vector.
 * @param {vec2} v2 The second vector.
 * @param {real}    t  The interpolation factor.
 * @return {vec2} The resulting vector.
 */
gml_pragma("forceinline");
return PEd_vec2(lerp(argument0[0], argument1[0], argument2),
                lerp(argument0[1], argument1[1], argument2));
