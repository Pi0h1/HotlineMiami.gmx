/// PEd_vec2Dot(v1, v2)
/**
 * @brief Gets the dot product of the two vectors.
 * @param {vec2} v1 The first vector.
 * @param {vec2} v2 The second vector.
 * @return {vec2} The dot product of the two vectors.
 */
gml_pragma("forceinline");
return (argument0[0] * argument1[0]
      + argument0[1] * argument1[1]);
