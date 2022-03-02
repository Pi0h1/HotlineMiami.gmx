/// PEd_guiMatrixSet(x, y)
/**
 * @brief Stores the current matrix into the matrix stack
 *        and sets the origin of the coordinate system to
 *        the given values.
 * @param {real} x The origin on the x axis.
 * @param {real} y The origin on the y axis.
 */
ds_stack_push(guiMatrixStack, matrix_get(matrix_world));
d3d_transform_set_identity();
d3d_transform_add_translation(argument0, argument1, 0);
