SteamRunCallbacks();
if (global.loaded) {
    with (objSurfacer) {
        scrSurfaceTiles();
    }
    with (objWeapon) {
        if (object_index == objSpecificWeapon) {
            // do nothing
        } else {
            instance_create(x, y, objWeapon);
            instance_destroy();
        }
    }
    global.loaded = 0;
    scrSaveTiles();
}
if (global.xbox) {
    if (checkbutton(0, getid(6))) {
        if (!pressback) {
            pressback = 1;
            scrXboxEffectorHousePause();
        }
    } else pressback = 0;
}

if (save) {
    save = 0;
    test = objPlayer.persistent;
    objPlayer.persistent = 0;
    global.loaded = 1;
    game_save(working_directory + "\\tempsave.sav");
    global.loaded = 0;
    objPlayer.persistent = test;
}

scrLockInEffectStep();

