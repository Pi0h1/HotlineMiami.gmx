/// PEd_vec3Normalize(vector)
/**
 * @brief Normalizes the vector.
 * @param {vec3} vector The vector.
 * @return {vec3} The normalized vector.
 */
var _n = 1 / sqrt(argument0[0]*argument0[0] + argument0[1]*argument0[1] + argument0[2]*argument0[2]);
return PEd_vec3(argument0[0] * _n,
                argument0[1] * _n,
                argument0[2] * _n);
