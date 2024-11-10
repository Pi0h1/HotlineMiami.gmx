/// PEd_actSwitchToTileMode()
/**
 * @brief Switches to tile edit mode.
 */
if (!global.pedUsing3D) 
{
    if (editMode != PEdEditModes.Tile) 
    {
        editMode = PEdEditModes.Tile;
        PEd_actClearSelection();
        PEd_guiRequestRedrawAll(guiRoot)
        PEd_guiShowPopupMessage("Tile editing mode.");
    }
}
else 
{
    PEd_guiShowPopupMessage("Cannot change editing mode in 3D.");
}
