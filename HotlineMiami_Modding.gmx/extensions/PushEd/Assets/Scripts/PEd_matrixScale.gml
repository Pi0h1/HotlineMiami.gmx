/// PEd_matrixScale(matrix, val)
/**
 * @brief Scales the matrix by the given value.
 * @param {matrix} matrix The matrix to be scaled.
 * @param {real}   val    The value to scale the matrix by.
 * @return {matrix} The scaled matrix.
 */
var _m = argument0;
for (var i = 0; i < 16; i++)
{
    _m[i] *= argument1;
}
return _m;
