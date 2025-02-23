/// PEd_matrixIdentity()
/**
 * @brief Gets an identity matrix.
 * @return {matrix} An identity matrix.
 */
gml_pragma("forceinline");
return PEd_matrix(PEd_vec4(1, 0, 0, 0),
                  PEd_vec4(0, 1, 0, 0),
                  PEd_vec4(0, 0, 1, 0),
                  PEd_vec4(0, 0, 0, 1));
