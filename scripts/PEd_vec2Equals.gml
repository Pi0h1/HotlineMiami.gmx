/// PEd_vec2Equals(v1, v2)
/**
 * @brief Gets whether the two vectors are equal.
 * @param {vec2} v1 The first vector.
 * @param {vec2} v2 The second vector.
 * @return {bool} True if the two vectors are equal.
 */
gml_pragma("forceinline");
return (argument0[0] == argument1[0]
     && argument0[1] == argument1[1]);
