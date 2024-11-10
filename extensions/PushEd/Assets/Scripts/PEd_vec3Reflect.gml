/// PEd_vec3Reflect(v1, v2)
/**
 * @brief Reflects the first vector off the second vector.
 * @param {vec3} v1 The first vector.
 * @param {vec3} v2 The second vector. Should be normalized.
 * @return {vec3} The resulting vector.
 */
var _dot = PEd_vec3Dot(argument0, argument1);
return PEd_vec3(-(argument0[0] - 2 * _dot * argument1[0]),
                -(argument0[1] - 2 * _dot * argument1[1]),
                -(argument0[2] - 2 * _dot * argument1[2]));
