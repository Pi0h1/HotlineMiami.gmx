if (wait > 0)
    wait--;

//Xbox Controls
if (global.xbox) {
    if (checkbutton(0, getid(5))) {
        if (!presstart) {
            presstart = 1;
            scrXboxMenuStart();
        }
    } else presstart = 0;

    if (checkbutton(0, getid(6))) {
        if (!pressback) {
            pressback = 1;
            scrXboxMenuQuit();
        }
    } else pressback = 0;

    if (leftthumb_x(0) > 10000) {
        if (!pressright) {
            pressright = 1;
            scrXboxMenuRight();
        }
    } else pressright = 0;

    if (leftthumb_x(0) < -10000) {
        if (!pressleft) {
            pressleft = 1;
            scrXboxMenuLeft();
        }
    } else pressleft = 0;

    if (leftthumb_y(0) > 10000) {
        if (!pressup) {
            pressup = 1;
            scrXboxMenuUp();
        }
    } else pressup = 0;

    if (leftthumb_y(0) < -10000) {
        if (!pressdown) {
            pressdown = 1;
            scrXboxMenuDown();
        }
    } else pressdown = 0;

}

if (!surface_exists(global.surf1)) {
    global.surf1 = surface_create(room_width, room_height);
    if (surface_exists(global.surf1)) {
        surface_set_target(global.surf1);
        draw_clear_alpha(c_black, 0);
        surface_reset_target();
    }
}

//Keyboard Behaviour
if (keyboard_check_pressed(ord(global.upkey)))
    event_perform(ev_keypress, ord("W"));
if (keyboard_check_pressed(ord(global.downkey)))
    event_perform(ev_keypress, ord("S"));
if (keyboard_check_pressed(ord(global.rightkey)))
    event_perform(ev_keypress, ord("D"));
if (keyboard_check_pressed(ord(global.leftkey)))
    event_perform(ev_keypress, ord("A"));

if (!surface_exists(global.surf1))
    exit;
surface_set_target(global.surf1);
draw_clear_alpha(c_black, 0);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

i = 0;
ii = 0;

//Main menu font
draw_set_font(fntMenu);


if (level == 3) {
    amount = 0.5 + lengthdir_x(0.5, dir * 10);
    draw_set_color(merge_color(c_white, c_aqua, amount));
    draw_text(x + 1, y + 56, string_hash_to_newline("WARNING!"));
    amount = 0.5 - lengthdir_x(0.5, dir * 10);
    draw_set_color(merge_color(c_white, c_aqua, amount));
    draw_text(x, y + 56, string_hash_to_newline("WARNING!"));
    draw_set_font(fntWarning);
    draw_set_color(c_black);
    draw_text(x + 1, y + 86, string_hash_to_newline("PLEASE UPDATE YOUR GAMEPAD DRIVERS#BEFORE ENABLING THIS FEATURE!#ARE YOU SURE YOU WANT TO PROCEED?"));
    draw_text_color(x, y + 85, string_hash_to_newline("PLEASE UPDATE YOUR GAMEPAD DRIVERS#BEFORE ENABLING THIS FEATURE!#ARE YOU SURE YOU WANT TO PROCEED?"), merge_color(c_white, c_yellow, 0.5 + lengthdir_x(0.5, dir * 10)), merge_color(c_white, c_yellow, 0.5 + lengthdir_x(0.5, dir * 10 + 90)), merge_color(c_white, c_yellow, 0.5 + lengthdir_x(0.5, dir * 10 + 180)), merge_color(c_white, c_yellow, 0.5 + lengthdir_x(0.5, dir * 10 + 270)), 1);

    draw_set_color(c_black);
    draw_text(x + 1, 215, string_hash_to_newline("THE LATEST GAMEPAD DRIVERS CAN BE#DOWNLOADED FREE AT MICROSOFT.COM!"));
    draw_set_color(c_white);
    draw_text(x, 214, string_hash_to_newline("THE LATEST GAMEPAD DRIVERS CAN BE#DOWNLOADED FREE AT MICROSOFT.COM!"));
    draw_set_font(fntMenu);
    start_x = 160;
    repeat(2) {
        if (select == i) {
            repeats = 6 + lengthdir_x(5, dir * 10);
            repeat(repeats) {
                draw_set_color(merge_color(c_fuchsia, c_white, ii * 0.085));
                draw_text(start_x + ii, y + 56 + 60, string_hash_to_newline(alt[i]));
                ii++;
            }
        } else {
            amount = 0.5 + lengthdir_x(0.5, dir * 10);
            draw_set_color(merge_color(c_white, c_aqua, amount));
            draw_text(start_x + 1, y + 56 + 60 + 1, string_hash_to_newline(alt[i]));
            amount = 0.5 - lengthdir_x(0.5, dir * 10);
            draw_set_color(merge_color(c_white, c_aqua, amount));
            draw_text(start_x, y + 56 + 60, string_hash_to_newline(alt[i]));
        }
        i++;
        start_x += 80;
    }
}



//Music slider
if (level == 2) {
    alt[0] = "MUSIC " + string(round(global.mvol * 100)) + "%";
    repeat(2) {
        if (select == i) {
            repeats = 6 + lengthdir_x(5, dir * 10);
            repeat(repeats) {
                draw_set_color(merge_color(c_fuchsia, c_white, ii * 0.085));
                draw_text(x + ii, y + 56 + i * 20, string_hash_to_newline(alt[i]));
                ii++;
            }
        } else {
            amount = 0.5 + lengthdir_x(0.5, dir * 10);
            draw_set_color(merge_color(c_white, c_aqua, amount));
            draw_text(x + 1, y + 56 + i * 20 + 1, string_hash_to_newline(alt[i]));
            amount = 0.5 - lengthdir_x(0.5, dir * 10);
            draw_set_color(merge_color(c_white, c_aqua, amount));
            draw_text(x, y + 56 + i * 20, string_hash_to_newline(alt[i]));
        }
        i++;
    }
}

if (level == 1) {
    repeat(5) {
        if (select == i) {
            repeats = 6 + lengthdir_x(5, dir * 10);
            repeat(repeats) {
                draw_set_color(merge_color(c_fuchsia, c_white, ii * 0.085));
                draw_text(x + ii, y + 56 + i * 20, string_hash_to_newline(alt[i]));
                ii++;
            }
        } else {
            amount = 0.5 + lengthdir_x(0.5, dir * 10);
            draw_set_color(merge_color(c_white, c_aqua, amount));
            draw_text(x + 1, y + 56 + i * 20 + 1, string_hash_to_newline(alt[i]));
            amount = 0.5 - lengthdir_x(0.5, dir * 10);
            draw_set_color(merge_color(c_white, c_aqua, amount));
            draw_text(x, y + 56 + i * 20, string_hash_to_newline(alt[i]));
        }
        i++;
    }
}

if (level == 0) {
    repeat(4) {
        if (select == i) {
            repeats = 6 + lengthdir_x(5, dir * 10);
            repeat(repeats) {
                draw_set_color(merge_color(c_fuchsia, c_white, ii * 0.085));
                draw_text(x + ii, y + 56 + i * 20, string_hash_to_newline(alt[i]));
                ii++;
            }
        } else {
            amount = 0.5 + lengthdir_x(0.5, dir * 10);
            draw_set_color(merge_color(c_white, c_aqua, amount));
            draw_text(x + 1, y + 56 + i * 20 + 1, string_hash_to_newline(alt[i]));
            amount = 0.5 - lengthdir_x(0.5, dir * 10);
            draw_set_color(merge_color(c_white, c_aqua, amount));
            draw_text(x, y + 56 + i * 20, string_hash_to_newline(alt[i]));
        }
        i++;
    }
}

if (level == 4) {
    start_y = 0;

    draw_set_font(fntWarning);
    draw_set_color(c_black);
    draw_text(x + 1, y + 80, string_hash_to_newline("TURN OFF IF YOU ARE GETTING STUCK#BETWEEN FLOORS AND CAN'T PROGRESS"));
    draw_text_color(x, y + 80, string_hash_to_newline("TURN OFF IF YOU ARE GETTING STUCK#BETWEEN FLOORS AND CAN'T PROGRESS"), merge_color(c_white, c_yellow, 0.5 + lengthdir_x(0.5, dir * 10)), merge_color(c_white, c_yellow, 0.5 + lengthdir_x(0.5, dir * 10 + 90)), merge_color(c_white, c_yellow, 0.5 + lengthdir_x(0.5, dir * 10 + 180)), merge_color(c_white, c_yellow, 0.5 + lengthdir_x(0.5, dir * 10 + 270)), 1);
    draw_set_font(fntMenu);

    repeat(4) {
        if (i == 1)
            start_y += 28;
        if (select == i) {
            repeats = 6 + lengthdir_x(5, dir * 10);
            repeat(repeats) {
                draw_set_color(merge_color(c_fuchsia, c_white, ii * 0.085));
                draw_text(x + ii, y + 56 + i * 20 + start_y, string_hash_to_newline(alt[i]));
                ii++;
            }
        } else {
            if (i == 1 && global.surfaces) {
                amount = 0.5 + lengthdir_x(0.5, dir * 10);
                draw_set_color(merge_color(c_gray, c_dkgray, amount));
                draw_text(x + 1, y + 56 + i * 20 + 1 + start_y, string_hash_to_newline(alt[i]));
                amount = 0.5 - lengthdir_x(0.5, dir * 10);
                draw_set_color(merge_color(c_gray, c_dkgray, amount));
                draw_text(x, y + 56 + i * 20 + start_y, string_hash_to_newline(alt[i]));
            } else {
                amount = 0.5 + lengthdir_x(0.5, dir * 10);
                draw_set_color(merge_color(c_white, c_aqua, amount));
                draw_text(x + 1, y + 56 + i * 20 + 1 + start_y, string_hash_to_newline(alt[i]));
                amount = 0.5 - lengthdir_x(0.5, dir * 10);
                draw_set_color(merge_color(c_white, c_aqua, amount));
                draw_text(x, y + 56 + i * 20 + start_y, string_hash_to_newline(alt[i]));
            }
        }
        i++;
    }
}

draw_set_blend_mode(bm_normal);


if (coldir > 90) {
    i = 0;
    times = lengthdir_x(40, dir * 12);
    if (times < 1)
        times = 1;
    repeat(1 + (coldir - 90) * 0.4) {

        //Colours of the text.
        color2 = merge_color(c_fuchsia, color, i * 0.025);
        color9 = merge_color(c_red, c_white, i * 0.025);

        //Draws 3D Logo.
        draw_sprite_ext(sprTitle, 0, lengthdir_x(i * 0.25, dir * 4 + 180) + x + lengthdir_x(i * 0.5, dir * 4), lengthdir_y(i * 0.25, dir * 4 + 180) + y + lengthdir_y(i * 0.5, dir * 4), 1, 1, lengthdir_y(5, dir * 4), color2, 1);
        if (i < times)
            draw_sprite_ext(sprTitle, 1, lengthdir_x(i * 0.25, dir * 4 + 180) + x + lengthdir_x(i * 0.5, dir * 4), lengthdir_y(i * 0.25, dir * 4 + 180) + y + lengthdir_y(i * 0.5, dir * 4), 1, 1, lengthdir_y(5, dir * 4), color9, 1);
        i++;
    }
} else {
    draw_sprite_ext(sprTitle, 0, x, y, 1, 1, lengthdir_y(5, dir * 4), c_fuchsia, 1);
}
surface_alpha();
surface_reset_target();

