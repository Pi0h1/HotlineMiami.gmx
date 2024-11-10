/// PEd_actSwitchGrid()
/**
 * @brief Switches aligning to the grid on/off.
 */
var _room = PEd_getCurrentRoom();
PEd_roomSetGrid(_room, !PEd_roomGetGrid(_room));
if (PEd_roomGetGrid(_room)) 
{
    PEd_guiShowPopupMessage("Enabled snapping to grid.");
}
else 
{
    PEd_guiShowPopupMessage("Disabled snapping to grid.");
}
