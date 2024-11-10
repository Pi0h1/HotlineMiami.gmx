/// PEd_actExit()
/**
 * @brief Quits the editor.
 */
// Activate all instances
instance_activate_all();

// Instance activate all works only after end of the script so we have to put
// the rest into alarm :-/
alarm[5] = 1;
