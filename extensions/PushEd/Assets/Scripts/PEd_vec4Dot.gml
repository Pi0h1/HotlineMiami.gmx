/// PEd_vec4Dot(v1, v2)
/**
 * @brief Gets the dot product of the two vectors.
 * @param {vec4} v1 The first vector.
 * @param {vec4} v2 The second vector.
 * @return {vec4} The dot product of the two vectors.
 */
gml_pragma("forceinline");
return (argument0[0] * argument1[0]
      + argument0[1] * argument1[1]
      + argument0[2] * argument1[2]
      + argument0[3] * argument1[3]);
