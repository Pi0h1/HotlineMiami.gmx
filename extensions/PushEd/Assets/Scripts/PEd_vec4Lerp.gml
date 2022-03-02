/// PEd_vec4Lerp(v1, v2, t)
/**
 * @brief Linearly interpolates between the two vectors.
 * @param {vec4} v1 The first vector.
 * @param {vec4} v2 The second vector.
 * @param {real} t  The interpolation factor.
 * @return {vec4} The resulting vector.
 */
gml_pragma("forceinline");
return PEd_vec4(lerp(argument0[0], argument1[0], argument2),
                lerp(argument0[1], argument1[1], argument2),
                lerp(argument0[2], argument1[2], argument2),
                lerp(argument0[3], argument1[3], argument2));
