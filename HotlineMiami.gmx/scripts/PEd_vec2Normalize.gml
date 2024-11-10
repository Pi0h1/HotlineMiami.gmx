/// PEd_vec2Normalize(vector)
/**
 * @brief Normalizes the vector.
 * @param {vec2} vector The vector.
 * @return {vec2} The normalized vector.
 */
var _n = 1 / sqrt(argument0[0]*argument0[0] + argument0[1]*argument0[1]);
return PEd_vec2(abs(argument0[0] * _n),
                abs(argument0[1] * _n));
