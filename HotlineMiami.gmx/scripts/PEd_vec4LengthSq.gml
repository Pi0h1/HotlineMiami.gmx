/// PEd_vec4LengthSq(vector)
/**
 * @brief Gets squared length of the vector.
 * @param {vec4} vector The vector.
 * @return {real} The length of the vector.
 */
gml_pragma("forceinline");
return (argument0[0] * argument0[0]
      + argument0[1] * argument0[1]
      + argument0[2] * argument0[2]
      + argument0[3] * argument0[3]);
