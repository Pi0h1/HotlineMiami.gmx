if (global.xbox) {

    if (checkbutton(0, getid(6))) {
        if (!pressback) {
            pressback = 1;
            scrXboxPuzzleQuit();
        }
    } else pressback = 0;

    if (gettrigger_r() > 100) {
        if (!pressrtrig) {
            pressrtrig = 1;
            scrXboxPuzzlePress();
        }
    } else {
        if (pressrtrig) {
            scrXboxPuzzleRelease()
            pressrtrig = 0;
        }
    }

    if (leftthumb_x(0) > 15000) {
        mousex += 3;
    }

    if (leftthumb_x(0) < -15000) {
        mousex -= 3;
    }

    if leftthumb_y(0) < -5000 {
        mousey += 3;
    }

    if leftthumb_y(0) > 5000 {
        mousey -= 3;
    }

}



if (off) {
    global.check = 0;
    with (objLetterSocket) {
        x += 16;
        if (x < 416)
            global.check = 1;
    }
    with (objLetter) {
        follow = 0;
        x -= 16;
        if (x > -16)
            global.check = 1;
    }
    with (objLetterDone) {
        x += 16;
        if (x < 416)
            global.check = 1;
    }
    if (!global.check) {
        with (objLetterSocket)
            instance_destroy();
        with (objLetter)
            instance_destroy();
        with (objLetterDone)
            instance_destroy();
        surface_free(surf1);
        instance_destroy();
        objPause.on = 1;
        objPause.state = 0;
        objPause.textdir1 = 0;
        objPause.textdir2 = 0;
        exit;
    }

}
if (factor < 1)
    factor += 0.05;
dir += 2;
if (instance_number(objLetterDone) == 16) {
    if (!global.puzzledone) {
        global.puzzledone = 1;
        SteamSetAchievement("ACH_THE_BOSS");
        scrSaveUnlocked();
    }
    if (factor < 1)
        factor += 0.05;
    surface_set_target(surf1);
    draw_clear_alpha(c_black, 0);
    with (objLetterDone) {
        times = 8 * objPuzzle.factor + lengthdir_y(16 * objPuzzle.factor, (image_index * (1 / 13)) * 360);
        if (times < 1)
            times = 1;
        i = 0;
        ldir = point_direction(room_width / 2, room_height * 0.75, x, y);
        draw_set_blend_mode(bm_add);
        repeat (times) {
            draw_sprite_ext(glowsprite, 0, x + lengthdir_x(i * 0.5, ldir), y + lengthdir_y(i * 0.5, ldir), 1 + i * 0.01, 1 + i * 0.01, 0, merge_color(c_fuchsia, merge_color(c_aqua, c_black, i * (1 / times)), i * (1 / times)), 1);
            i++;
        }
    }
    draw_set_blend_mode(bm_normal);
    surface_reset_target();
}

