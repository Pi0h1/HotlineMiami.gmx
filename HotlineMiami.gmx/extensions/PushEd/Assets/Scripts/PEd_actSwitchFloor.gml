/// PEd_actSwitchFloor()
/**
 * @brief Switches drawing of the floor on/off.
 */
editFloor = !editFloor;
if (editFloor) 
{
    PEd_guiShowPopupMessage("Show floor.");
}
else 
{
    PEd_guiShowPopupMessage("Hide floor.");
}
