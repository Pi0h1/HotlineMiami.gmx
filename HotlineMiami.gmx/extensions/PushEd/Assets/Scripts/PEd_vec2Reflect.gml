/// PEd_vec2Reflect(v1, v2)
/**
 * @brief Reflects the first vector off the second vector.
 * @param {vec2} v1 The first vector.
 * @param {vec2} v2 The second vector. Should be normalized.
 * @return {vec2} The resulting vector.
 */
var _dot = PEd_vec2Dot(argument0, argument1);
return PEd_vec2(-(argument0[0] - 2 * _dot * argument1[0]),
                -(argument0[1] - 2 * _dot * argument1[1]));
