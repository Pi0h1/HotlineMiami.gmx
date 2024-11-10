/// PEd_guiMatrixPush(x, y)
/**
 * @brief Stores the current matrix into the matrix stack
 *        and then pushes the coordinate system by the
 *        given values.
 * @param {real} x The value to push the coordinate system by on the x axis.
 * @param {real} y The value to push the coordinate system by on the y axis.
 */
ds_stack_push(guiMatrixStack, matrix_get(matrix_world));
d3d_transform_add_translation(argument0, argument1, 0);
