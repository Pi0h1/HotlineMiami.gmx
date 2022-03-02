/// PEd_guiDestroyShape(shape)
/**
 * @brief Destroys the shape.
 * @param {real} shape The id of the shape.
 */
gml_pragma("forceinline");
if (PEd_guiShapeExists(argument0))
{
    ds_stack_push(guiDestroyStack, argument0);
}
