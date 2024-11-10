/// PEd_guiCleanUp()
/**
 * @brief Frees resources used by GUI from memory.
 */
PEd_guiShapeCleanUp(guiRoot);
ds_stack_destroy(guiMatrixStack);
ds_stack_destroy(guiDestroyStack);
ds_list_destroy(guiKeyLog);
