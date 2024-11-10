/// PEd_actSwitchTool()
/**
 * @brief Loops between tools.
 */
editTool += 1;
if (editTool > 2) 
{
    editTool = 0;
}
PEd_guiRequestRedrawAll(guiRoot);
