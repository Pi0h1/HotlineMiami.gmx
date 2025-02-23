/// PEd_switchMode()
/**
 * @brief Switches between 2D/3D mode.
 * @note This cannot be executed in the draw event!
 */
global.pedUsing3D = !global.pedUsing3D;
if (global.pedUsing3D) 
{
    PEd_start3D();
}
else 
{
    PEd_end3D();
}
PEd_guiRequestRedrawAll(guiRoot)
editMode = 0;
ds_list_clear(selectedObjects);
ds_list_clear(selectedObjectsData);
