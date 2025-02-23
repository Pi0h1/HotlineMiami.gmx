/// PEd_actSwitchToObjectMode()
/**
 * @brief Switches to object edit mode.
 */
if (editMode != PEdEditModes.Object) 
{
    editMode = PEdEditModes.Object;
    PEd_actClearSelection();
    PEd_guiRequestRedrawAll(guiRoot)
    PEd_guiShowPopupMessage("Object editing mode.");
}
