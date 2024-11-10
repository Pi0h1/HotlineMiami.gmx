/// PEd_vec4Normalize(vector)
/**
 * @brief Normalizes the vector.
 * @param {vec4} vector The vector.
 * @return {vec4} The normalized vector.
 */
var _n = 1 / sqrt(argument0[0]*argument0[0] + argument0[1]*argument0[1] + argument0[2]*argument0[2] + argument0[3]*argument0[3]);
return PEd_vec4(abs(argument0[0] * _n),
                abs(argument0[1] * _n),
                abs(argument0[2] * _n),
                abs(argument0[3] * _n));
