/// PEd_guiMatrixRestore()
/**
 * @brief Restores coordinate system by popping matrix from
 *        the top of the matrix stack.
 */
gml_pragma("forceinline");
matrix_set(matrix_world, ds_stack_pop(guiMatrixStack));
