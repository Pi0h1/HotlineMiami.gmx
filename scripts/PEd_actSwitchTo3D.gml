/// PEd_actSwitchTo3D()
/**
 * @brief Switches to the 3D mode.
 */
if (!global.pedUsing3D) 
{
    var _q = "Do you really want to switch to 3D mode?"
            + " In this mode every instance that you"
            + " want to edit has to containt variables"
            + " for 3D transformations!";
        
    if (show_question(_q)) 
    {
        modeSwitch = true;
        PEd_guiShowPopupMessage("3D mode.");
    }
}
