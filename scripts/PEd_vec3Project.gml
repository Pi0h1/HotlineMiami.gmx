/// PEd_vec3Project(vector, screen, world, view, projection)
/**
 * @brief Projects the vector from world space into screen space.
 * @param {vec3}   vector     The vector.
 * @param {vec2}   screen     The screen size.
 * @param {matrix} world      The world matrix.
 * @param {matrix} view       The view matrix.
 * @param {matrix} projection The projection matrix. 
 * @return {vec4} The projected vector.
 */
var _vec = PEd_vec4(argument0[0], argument0[1], argument0[2], 1);
var _mat = matrix_multiply(matrix_multiply(argument2, argument3), argument4);
_vec = PEd_vec4Transform(_vec, _mat);
_vec = PEd_vec4Scale(_vec, 1 / _vec[3]);
_vec[0] = (_vec[0] * 0.5 + 0.5) * argument1[0];
_vec[1] = (1 - (_vec[1] * 0.5 + 0.5)) * argument1[1];
return _vec;
