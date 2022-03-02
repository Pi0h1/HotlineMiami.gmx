/// PEd_vec3Clone(vector)
/**
 * @brief Clones the vector.
 * @param {vec3} vector The vector to clone.
 * @return {vec3} The vector clone.
 */
gml_pragma("forceinline");
return PEd_vec3(argument0[0], argument0[1], argument0[2]);
