/// PEd_actSwitchEditMode()
/**
 * @brief If not in 3D then switches between object and tile edit mode.
 */
if (!global.pedUsing3D) 
{
    if ((++editMode) > 1) 
    {
        editMode = 0;
    }
    PEd_actClearSelection();
}
