/// PEd_vec4Transform(vector, matrix)
/**
 * @brief Transforms the vector with the matrix.
 * @param {vec4}   vector The vector.
 * @param {matrix} matrix The matrix.
 * @return {vec4} The resulting vector.
 */
gml_pragma("forceinline");
return PEd_vec4(argument1[ 0]*argument0[0] + argument1[ 4]*argument0[1] + argument1[ 8]*argument0[2] + argument1[12]*argument0[3],
                argument1[ 1]*argument0[0] + argument1[ 5]*argument0[1] + argument1[ 9]*argument0[2] + argument1[13]*argument0[3],
                argument1[ 2]*argument0[0] + argument1[ 6]*argument0[1] + argument1[10]*argument0[2] + argument1[14]*argument0[3],
                argument1[ 3]*argument0[0] + argument1[ 7]*argument0[1] + argument1[11]*argument0[2] + argument1[15]*argument0[3]);
