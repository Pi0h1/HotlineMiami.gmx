if (global.xbox)
    scrXboxCeoTable();

if (state == 1) {
    if (!instance_exists(objPhoneConversation)) {
		checkpoint_save(working_directory + "\\tempsave.sav");
        state = 2;
        instance_create(320, 40, objPlayerBoss);
    }
} else {
    if (room == rmPhoneHomUpstairsBiker && state == 0 && !instance_exists(objCEO))
        with (objElevator)
            valid = 0;
}

