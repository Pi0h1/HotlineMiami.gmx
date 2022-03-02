/// PEd_actSaveRoom()
/**
 * @brief Saves the room.
 */
// Make sure that all instances that you want  to save are activated,
// deactivated instances can not be saved!
instance_activate_all();

// Instance activate all works only after end of the script so we have to put
// the rest into alarm :-/
alarm[0] = 1;
