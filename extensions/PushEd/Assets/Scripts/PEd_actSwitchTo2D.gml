/// PEd_actSwitchTo2D()
/**
 * @brief Switches to the 2D mode.
 */
if (global.pedUsing3D)
{
    var _q = "Do you really want to switch to 2D mode?"
            + " In this mode variables used only for"
            + " 3D will not be saved!";
        
    if (show_question(_q)) 
    {
        modeSwitch = true;
        PEd_guiShowPopupMessage("2D mode.");
    }
}
