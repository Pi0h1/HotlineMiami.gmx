/// PEd_actPlayRoom()
/**
 * @brief Saves the room into a "play.bbmap" file and goes to PEd_rmPlay.
 */
var _room = PEd_getCurrentRoom();
var _name = PEd_roomGetName(_room);
if (PEd_roomSaveToBBMAP2(_room, "play.bbmap"))
{
    PEd_roomSetName(_room, _name);
    room_goto(PEd_rmPlay);
}
