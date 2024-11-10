/// PEd_vec2Length(vector)
/**
 * @brief Gets the length of the vector.
 * @param {vec2} vector The vector.
 * @return {real} The length of the vector.
 */
gml_pragma("forceinline");
return sqrt(argument0[0] * argument0[0]
          + argument0[1] * argument0[1]);
