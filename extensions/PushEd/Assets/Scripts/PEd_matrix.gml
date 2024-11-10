/// PEd_matrix(m0, m1, m2, m3)
/**
 * @brief Creates a new 4x4 matrix.
 * @param {vec4} m0 The first row of the matrix.
 * @param {vec4} m1 The second row of the matrix.
 * @param {vec4} m2 The third row of the matrix.
 * @param {vec4} m3 The fourth row of the matrix.
 * @return {matrix} The created matrix.
 */
var _mat; _mat[15] = 0;
_mat[ 0] = argument0[0];    _mat[ 4] = argument1[0];    _mat[ 8] = argument2[0];    _mat[12] = argument3[0];
_mat[ 1] = argument0[1];    _mat[ 5] = argument1[1];    _mat[ 9] = argument2[1];    _mat[13] = argument3[1];
_mat[ 2] = argument0[2];    _mat[ 6] = argument1[2];    _mat[10] = argument2[2];    _mat[14] = argument3[2];
_mat[ 3] = argument0[3];    _mat[ 7] = argument1[3];    _mat[11] = argument2[3];    _mat[15] = argument3[3];
return _mat;
