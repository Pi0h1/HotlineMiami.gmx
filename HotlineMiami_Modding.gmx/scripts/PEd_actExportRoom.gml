/// PEd_actExportRoom()
// Activate all instances
instance_activate_all();

// Instance activate all works only after end of the script so we have to put
// the rest into alarm :-/
alarm[1] = 1;
