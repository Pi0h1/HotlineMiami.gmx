if (global.xbox) {
    if (checkbutton(0, getid(5))) {
        if (!presstart) {
            presstart = 1;
            scrXboxEffectorStart();
        }
    } else presstart = 0;

    if (checkbutton(0, getid(6))) {
        if (!pressback) {
            pressback = 1;
            scrXboxEffectorPause();
        }
    } else pressback = 0;
}
// Play uzi sound for the waiters in Clean Hit (I believe this was done to not blast your eardrums when all of the waiters shoot at the player at once)
if (uzisnd) {
    uzisnd = 0;
    audio_play_sound(sndUzi, 0, false);
}
if (keyboard_check_pressed(ord(global.restartkey)))
    event_perform(ev_keypress, ord("R"));
SteamRunCallbacks();
// Load masks when dying on the first floor (due to how the checkpoint system works)
if (global.maskload) {
    scrLoadMask();
    global.maskload = 0;
    // Load mask abilities when player dies on the first floor
    with (objPlayer)
        scrGetMaskPowers();
}

if (global.loaded) {
    scrLoadAchievements();
    if (room == rmSwatUpstairs) {
        audio_stop_sound(sndPolice);
        // If player restarts during the police section of crackdown, set music back to crystals
        if (file_exists(working_directory + "\\restartmusic")) {
            sxeasy_play(working_directory + "\\Crystals.mp3");
            sxeasy_setVolume(1);
            file_delete(working_directory + "\\restartmusic");
            scrCheckpoint();
        }
    }
    scrLoadBonusList();
    
    with (objSurfacer) {
        scrSurfaceTiles();
    }
    
    // I think this generates a new weapon when dying and restarting?
    with (objWeapon) {
        if (object_index == objSpecificWeapon) {
            // do nothing
        } else {
            instance_create(x, y, objWeapon);
            instance_destroy();
        }
    }
    leveltitle = "";
    levelshow = 120;
    global.loaded = 0;
    
    if (global.maskindex == 9)
        objPlayer.energie = 1;
    if (global.maskindex == 21)
        objPlayer.energie = 2;
}
scrCheckMissionComplete();

if (!fade) {
    if (amount < 180) {
        amount += 5;
    }
}

if (fade) {
    if (amount > 0) {
        amount -= 10;
        if (restart || newsong || (room == rmSwatUpstairs && instance_exists(objSwat) && instance_exists(objPlayerDead))) {
            sxeasy_setVolume(amount * (1 / 180));
        }
    } else {
        fade = 0;
        if (restart) {
            if (file_exists(working_directory + "\\restartmusic"))
                file_delete(working_directory + "\\restartmusic");
            sxeasy_stop(1);
            sxeasy_setVolume(0);
            bgm_Close();
            game_restart();
        } else {
            if (next) {
                if (file_exists(working_directory + "\\restartmusic"))
                    file_delete(working_directory + "\\restartmusic");
                    if (newsong) {
                        sxeasy_stop(1);
                        sxeasy_setVolume(0);
                        sxeasy_play(song);
                    }
                room = nextroom;
            } else {
                if (room == rmSwatUpstairs && file_exists(working_directory + "\\restarmusic")) {
                    sxeasy_stop(1);
                    bgm_Unload(global.currentsong);
                }
                scrResetSurfaces();
                legacy_load(working_directory + "\\tempsave.sav");
            }
        }
    }
}

vlastx = camera_get_view_x(view_camera[0]);
vlasty = camera_get_view_y(view_camera[0]);

// Screen shake code
if (global.shake > 0) {
    global.shake -= 0.5;
    if (global.xbox)
        setrumble(0, 0, global.shake * (1 / 15) * 65535);
	camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (-global.shake * 0.33 + random(global.shake * 0.66)), camera_get_view_y(view_camera[0]) + (-global.shake * 0.33 + random(global.shake * 0.66)));
}

scrLockInEffectStep();;

