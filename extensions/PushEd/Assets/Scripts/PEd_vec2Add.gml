/// PEd_vec2Add(v1, v2)
/**
 * @brief Adds the two vectors.
 * @param {vec2} v1 The first vector.
 * @param {vec2} v2 The second vector.
 * @return {vec2} The resulting vector.
 */
gml_pragma("forceinline");
return PEd_vec2(argument0[0] + argument1[0],
                argument0[1] + argument1[1]);
