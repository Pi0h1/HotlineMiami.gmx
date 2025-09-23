if (wait > 0)
    wait--;
if (global.xbox) {
    if (checkbutton(0, getid(5))) {
        if (!presstart) {
            presstart = 1;
            scrXboxPauseStart();
        }
    } else presstart = 0;

    if (checkbutton(0, getid(6))) {
        if (!pressback) {
            pressback = 1;
            scrXboxPauseBack();
        }
    } else pressback = 0;

    if (leftthumb_y(0) > 5000) {
        if (!pressup) {
            pressup = 1;
            scrXboxPauseUp();
        }
    } else pressup = 0;

    if (leftthumb_y(0) < -5000) {
        if (!pressdown) {
            pressdown = 1;
            scrXboxPauseDown();
        }
    } else pressdown = 0;

}
if (keyboard_check_pressed(ord(global.upkey)))
    event_perform(ev_keypress, ord("W"));
if (keyboard_check_pressed(ord(global.downkey)))
    event_perform(ev_keypress, ord("S"));

SteamRunCallbacks();
if (!surface_exists(global.surf1)) {
    global.surf1 = surface_create(room_width, room_height);
    surface_set_target(global.surf1);
    draw_clear_alpha(c_black, 0);
    surface_reset_target();
}
surface_set_target(global.surf1);
draw_clear_alpha(c_black, 0);
text = "PAUSE";
if (on) {
    if (textdir2 < 180)
        textdir2 += 10;
} else {
    textdir2 = blacky * 180;
}
if (on)
    factor = 0.5 - lengthdir_x(0.5, textdir2);
else {
    if (factor > 0)
        factor -= 0.05;
    else {
        if (on) {
            if (!instance_exists(objPuzzle))
                instance_create(x, y, objPuzzle);
        }
    }
}
i = 0;
draw_set_font(fntUnlock);
draw_set_halign(fa_left);
draw_set_valign(fa_center);
start_x = __view_get( e__VW.WView, 0 ) / 2 - string_width(string_hash_to_newline(text)) * 0.5;
repeat(string_length(text)) * factor {
    letter = string_copy(text, 1 + i, 1);
    ii = 0;
    repeat(5 + lengthdir_x(4, textdir1 + i * 60)) {
        draw_set_color(merge_color(c_teal, c_white, ii * 0.1));
        draw_text_transformed(start_x, room_height * 0.35 - ii * 0.5, string_hash_to_newline(letter), 1 + ii * 0.01, 1 + ii * 0.01, 0);
        ii++;
    }
    start_x += string_width(string_hash_to_newline(letter));
    i++;
}
draw_set_font(fntMenu);
i = 0;
ii = 0;
repeat(4) {
    if (select == i) {
        repeats = 6 + lengthdir_x(5, dir * 2);
        if (on) {
            if (frac(i * 0.5) > 0)
                addx = 260 * (1 - factor);
            else addx = -260 * (1 - factor);
        } else {
            if (frac(i * 0.5) > 0)
                addx = -260 * (1 - factor);
            else addx = 260 * (1 - factor);
        }
        repeat(repeats) {
            draw_set_color(merge_color(c_fuchsia, c_white, ii * 0.085));
            draw_text(room_width / 2 - 56 + ii + addx, room_height / 2 + i * 20, string_hash_to_newline(choice[i]));
            ii++;
        }
    } else {
        if (on) {
            if (frac(i * 0.5) > 0)
                addx = 260 * (1 - factor);
            else addx = -260 * (1 - factor);
        } else {
            if (frac(i * 0.5) > 0)
                addx = -260 * (1 - factor);
            else addx = 260 * (1 - factor);
        }
        amount = 0.5 + lengthdir_x(0.5, dir * 2);
        if (test && i == 1)
            draw_set_color(merge_color(c_white, c_dkgray, amount));
        else draw_set_color(merge_color(c_white, c_aqua, amount));
        
        draw_text(room_width / 2 - 56 + 1 + addx, room_height / 2 + i * 20 + 1, string_hash_to_newline(choice[i]));
        amount = 0.5 - lengthdir_x(0.5, dir * 2);
        if (test && i == 1)
            draw_set_color(merge_color(c_white, c_dkgray, amount));
        else draw_set_color(merge_color(c_white, c_aqua, amount));
        draw_text(room_width / 2 - 56 + addx, room_height / 2 + i * 20, string_hash_to_newline(choice[i]));
    }
    i++;
}



textdir1--;
surface_alpha();
surface_reset_target();

