/// PEd_matrixTranspose(matrix)
/**
 * @brief Transposes the matrix.
 * @param {matrix} matrix The matrix to be transposed.
 * @return {matrix} The transposed matrix.
 */
var _m = argument0;
var _t;
_t[ 0] = _m[ 0];    _t[ 4] = _m[ 1];    _t[ 8] = _m[ 2];    _t[12] = _m[ 3];
_t[ 1] = _m[ 4];    _t[ 5] = _m[ 5];    _t[ 9] = _m[ 6];    _t[13] = _m[ 7];
_t[ 2] = _m[ 8];    _t[ 6] = _m[ 9];    _t[10] = _m[10];    _t[14] = _m[11];
_t[ 3] = _m[12];    _t[ 7] = _m[13];    _t[11] = _m[14];    _t[15] = _m[15];
return _t;
