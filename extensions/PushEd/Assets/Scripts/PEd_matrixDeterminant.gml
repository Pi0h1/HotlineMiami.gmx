/// PEd_matrixDeterminant(matrix)
/**
 * @brief Calculates determinant of the given matrix.
 * @param {matrix} matrix The matrix to calculate the determinant of.
 * @return {real} The determinant.
 */
gml_pragma("forceinline");
return (argument0[ 3]*argument0[ 6]*argument0[ 9]*argument0[12] - argument0[ 2]*argument0[ 7]*argument0[ 9]*argument0[12] - argument0[ 3]*argument0[ 5]*argument0[10]*argument0[12] + argument0[ 1]*argument0[ 7]*argument0[10]*argument0[12]
      + argument0[ 2]*argument0[ 5]*argument0[11]*argument0[12] - argument0[ 1]*argument0[ 6]*argument0[11]*argument0[12] - argument0[ 3]*argument0[ 6]*argument0[ 8]*argument0[13] + argument0[ 2]*argument0[ 7]*argument0[ 8]*argument0[13]
      + argument0[ 3]*argument0[ 4]*argument0[10]*argument0[13] - argument0[ 0]*argument0[ 7]*argument0[10]*argument0[13] - argument0[ 2]*argument0[ 4]*argument0[11]*argument0[13] + argument0[ 0]*argument0[ 6]*argument0[11]*argument0[13]
      + argument0[ 3]*argument0[ 5]*argument0[ 8]*argument0[14] - argument0[ 1]*argument0[ 7]*argument0[ 8]*argument0[14] - argument0[ 3]*argument0[ 4]*argument0[ 9]*argument0[14] + argument0[ 0]*argument0[ 7]*argument0[ 9]*argument0[14]
      + argument0[ 1]*argument0[ 4]*argument0[11]*argument0[14] - argument0[ 0]*argument0[ 5]*argument0[11]*argument0[14] - argument0[ 2]*argument0[ 5]*argument0[ 8]*argument0[15] + argument0[ 1]*argument0[ 6]*argument0[ 8]*argument0[15]
      + argument0[ 2]*argument0[ 4]*argument0[ 9]*argument0[15] - argument0[ 0]*argument0[ 6]*argument0[ 9]*argument0[15] - argument0[ 1]*argument0[ 4]*argument0[10]*argument0[15] + argument0[ 0]*argument0[ 5]*argument0[10]*argument0[15]);
