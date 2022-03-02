/// PEd_actCreateEmptyRoom()
/**
 * @brief Creates a new empty room.
 */
if (show_question("Do you really want to create new room?")) 
{
    instance_activate_all();
    alarm[3] = 1;
}
