add1 = (0.1 + lengthdir_x(0.1, maskamount)) * -1;
add2 = -lengthdir_x(0.3, maskamount);
add3 = 10 + lengthdir_x(10, maskamount);
color1 = merge_color(merge_color(c_black, c_purple, 0.2 + lengthdir_x(0.2, dir * 0.623)), c_black, 0.95 + add1 + lengthdir_x(0.05, dir * 0.9));
color2 = merge_color(merge_color(c_fuchsia, c_red, 0.5 + add2 + lengthdir_x(0.2, dir * 0.832)), c_black, 0.9 + add1 + lengthdir_x(0.1, dir * 1.32));
dir += 0.5;
draw_rectangle_color(0, 56 + lengthdir_x(12, maskamount) - add3, room_width, room_height - (56 + lengthdir_x(12, maskamount)) - add3, color1, color1, color2, color2, 0);

draw_set_blend_mode(bm_add);
color1 = make_color_hsv(25 + lengthdir_x(10, dir * 4), 155 + lengthdir_x(100, dir * 2.523), 25 + lengthdir_x(5, dir * 5.545));
i = 0;
add1 = lengthdir_x(50, maskamount);
add2 = lengthdir_x(2, maskamount);
repeat(32) {
    length = room_width / 2.5 + lengthdir_x(32, dir * 3 + i * 60) + add1;
    draw_line_width_color(room_width / 2, room_height / 2 - add3, room_width / 2 + lengthdir_x(length * 1.25, dir + i * (360 / 32)), room_height / 2 - add3 + lengthdir_y(length, dir + i * (360 / 32)), 5 + add2 + lengthdir_x(2, dir * 10 + i * ((360 / 32) * 5)), color1, c_black);
    i += 1;
}
draw_set_blend_mode(bm_subtract);

draw_circle_color(room_width / 2, room_height / 2 - add3, room_width * 0.8, c_black, c_gray, 0);
draw_set_blend_mode(bm_normal);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, 56 + lengthdir_x(12, maskamount) - add3, 0);
draw_rectangle(0, room_height, room_width, room_height - (56 + lengthdir_x(12, maskamount)) - add3, 0);

if (on) {
    if (maskamount > 0)
        maskamount -= 5;
    else global.masks[global.currentmask] = 1;
}

d3d_set_projection_ortho(0, 0, 399, 255, lengthdir_x(3, dir * 12));
color1 = c_black;
color2 = c_black;
color3 = c_black;
color4 = c_black;
if (maskamount < 180)
    color1 = merge_color(c_black, c_white, 0.5 + lengthdir_x(0.5, maskamount));
if (maskamount < 135)
    color2 = merge_color(c_black, c_white, 0.5 + lengthdir_x(0.5, maskamount * (180 / 135)));
if (maskamount < 90)
    color3 = merge_color(c_black, c_white, 0.5 + lengthdir_x(0.5, maskamount * (180 / 90)));
if (maskamount < 45)
    color4 = merge_color(c_black, c_white, 0.5 + lengthdir_x(0.5, maskamount * (180 / 45)));
scale = 2 + lengthdir_x(0.5, maskamount) + lengthdir_x(0.05 + lengthdir_x(0.025, maskamount), dir * 10);

draw_sprite_general(sprMasksBig, global.currentmask, 0, 0, 120, 120, room_width / 2 - 55 * scale + 2, room_height / 2 - 65 * scale + 2 - add3, scale, scale, 0, c_black, c_black, c_black, c_black, 0.5);
draw_sprite_general(sprMasksBig, global.currentmask, 0, 0, 120, 120, room_width / 2 - 55 * scale, room_height / 2 - 65 * scale - add3, scale, scale, 0, color1, color2, color3, color4, 1);

d3d_set_projection_ortho(0, 0, 399, 255, 0);
if (surface_exists(global.surf1)) {
    draw_surface_ext(global.surf1, -1, 0, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 1, 0, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, 1, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, -1, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, 0, 1, 1, 0, c_white, 1);
}
if (shine > 0) {
    draw_set_alpha(shine);
    draw_set_color(c_white);
    draw_rectangle(0, 0, room_width, room_height, 0);
    shine -= 0.1;
    draw_set_alpha(1);
}

if (!fade) {
    if (amount < 180) {
        amount += 5;
        color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, amount)), 0.5 + lengthdir_x(0.5, amount));
        if (amount > 90)
            color2 = merge_color(c_black, merge_color(c_fuchsia, c_white, abs(lengthdir_y(1, amount))), abs(lengthdir_y(1, amount)));
        else color2 = c_white;
        draw_set_blend_mode(bm_subtract);
        draw_rectangle_color(-10, -10, __view_get( e__VW.WView, 0 ) + 10, __view_get( e__VW.HView, 0 ) + 10, color1, color2, color2, color1, 0);
        draw_set_blend_mode(bm_normal);
    }
}

if (fade) {
    if (amount > 0) {
        amount -= 10;
        if (global.newguns == 0)
            sxeasy_setVolume(amount * (1 / 180));
        color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, amount)), 0.5 + lengthdir_x(0.5, amount));
        if (amount > 90)
            color2 = merge_color(c_black, merge_color(c_fuchsia, c_white, abs(lengthdir_y(1, amount))), abs(lengthdir_y(1, amount)));
        else color2 = c_white;
        draw_set_blend_mode(bm_subtract);
        draw_rectangle_color(-10, -10, __view_get( e__VW.WView, 0 ) + 10, __view_get( e__VW.HView, 0 ) + 10, color2, color1, color1, color2, 0);
        draw_set_blend_mode(bm_normal);
    } else {
        global.masks[global.currentmask] = 1;
        global.levels[scrGetCurrentLevel()] = 1;
        global.newmasks = 0;
        song = working_directory + "\\Daisuke.mp3";
        if (global.newguns > 0)
            next = rmWeaponUnlock;
        else {
            scrResetScore();
            if (global.sequence == rmMCSequence2Downstairs || global.sequence == rmMCSequence3Downstairs) {
                sxeasy_close();
                scrSaveUnlocked();
                game_restart();
                draw_clear(c_black);
                exit;
            } else {
                next = scrGetSequence(global.sequence);
                sxeasy_stop(1);
                sxeasy_setVolume(0);
                sxeasy_play(song);
                scrSaveUnlocked();
            }
        }

        room_goto(next);
    }
}

