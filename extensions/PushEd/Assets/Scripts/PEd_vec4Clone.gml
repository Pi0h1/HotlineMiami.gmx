/// PEd_vec4Clone(vector)
/**
 * @brief Clones the vector.
 * @param {vec4} vector The vector to clone.
 * @return {vec4} The vector clone.
 */
gml_pragma("forceinline");
return PEd_vec4(argument0[0], argument0[1], argument0[2], argument0[3]);
