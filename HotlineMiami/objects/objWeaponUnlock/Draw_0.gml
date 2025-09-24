scrCheckGuns();
color1 = merge_color(c_black, merge_color(c_red, c_maroon, 0.5 + lengthdir_x(0.5, dir * 2.21)), (factor * 0.6) + lengthdir_x((factor * 0.1), dir));
color2 = merge_color(merge_color(c_black, c_navy, 0.2 + lengthdir_x(0.1, dir)), c_black, factor);
dir += 1;
draw_rectangle_color(0, 45, room_width, room_height - 45, color1, color1, color2, color2, 0);
draw_set_color(merge_color(c_black, c_dkgray, shine));
draw_rectangle(0, 0, room_width, 45 + factor * 40, 0);
draw_rectangle(0, room_height - 45 - factor * 40, room_width, room_height, 0);
if (c_amount == 180)
    start_x += ((200 - start_x - current * 100)) * 0.05;
if (fade)
    start_x -= 10;
    
i = 0;
repeat(sprite_get_number(sprite_index)) {
    if (i > current)
        color = c_black;
    if (i == current)
        color = merge_color(c_black, c_white, factor);
    if (i < current)
        color = merge_color(c_white, c_black, factor * 0.2);
    if (current == i) {
        draw_sprite_ext(sprite_index, i, start_x + i * 100, room_height / 2, 2 + factor, 2 + factor, 25 + lengthdir_x(4, dir * 3 - i * 70), color, 1);
        if (shine > 0) {
            draw_set_blend_mode(bm_add);
            d3d_set_fog(1, merge_color(c_black, c_white, shine), 0, 0);
            draw_sprite_ext(sprite_index, i, start_x + i * 100, room_height / 2, 2 + factor, 2 + factor, 25 + lengthdir_x(4, dir * 3 - i * 70), color, 1);
            d3d_set_fog(0, 0, 0, 0);
            shine -= 0.05;
            draw_set_blend_mode(bm_normal);
        }
    } else draw_sprite_ext(sprite_index, i, start_x + i * 100, room_height / 2, 2 - factor * 0.5, 2 - factor * 0.5, 25 + lengthdir_x(4, dir * 3 - i * 70), color, 1);
    i++;
}

draw_surface_ext(global.surf1, 1, 0, 1, 1, 0, c_black, 1);
draw_surface_ext(global.surf1, 0, 1, 1, 1, 0, c_black, 1);
draw_surface_ext(global.surf1, 0, -1, 1, 1, 0, c_black, 1);
draw_surface_ext(global.surf1, -1, 0, 1, 1, 0, c_black, 1);
draw_surface_ext(global.surf1, 0, 0, 1, 1, 0, c_white, 1);

if (on) {
    if (factor < 1)
        factor += 0.05;
    else {
        if (last == current) {
            // do nothing
        } else {
            last = current;
            shine = 1;
            audio_play_sound(sndSplashFace, 0, false);
        }
    }
} else {
    if (factor > 0.1)
        factor -= 0.1;
    else factor = 0;
}


if (!fade) {
    if (c_amount < 180) {
        c_amount += 5;
        color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, c_amount)), 0.5 + lengthdir_x(0.5, c_amount));
        if (c_amount > 90)
            color2 = merge_color(c_black, merge_color(c_fuchsia, c_white, abs(lengthdir_y(1, c_amount))), abs(lengthdir_y(1, c_amount)));
        else color2 = c_white;
        draw_set_blend_mode(bm_subtract);
        draw_rectangle_color(camera_get_view_x(view_camera[0]) - 10, camera_get_view_y(view_camera[0]) - 10, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 10, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 10, color1, color2, color2, color1, 0);
        draw_set_blend_mode(bm_normal);
    }
}

if (fade) {
    if (c_amount > 0) {
        c_amount -= 5;
        sxeasy_setVolume(c_amount * (1 / 180));
        color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, c_amount)), 0.5 + lengthdir_x(0.5, c_amount));
        if (c_amount > 90)
            color2 = merge_color(c_black, merge_color(c_fuchsia, c_white, abs(lengthdir_y(1, c_amount))), abs(lengthdir_y(1, c_amount)));
        else color2 = c_white;
        draw_set_blend_mode(bm_subtract);
        draw_rectangle_color(camera_get_view_x(view_camera[0]) - 10, camera_get_view_y(view_camera[0]) - 10, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 10, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 10, color2, color1, color1, color2, 0);
        draw_set_blend_mode(bm_normal);
    } else {
        song = working_directory + "\\Daisuke.mp3";
        next = scrGetSequence(global.sequence);
        scrSaveUnlocked();
        sxeasy_stop(1);
        sxeasy_setVolume(0);
        sxeasy_play(song);
        scrResetScore();
        room_goto(next);
    }
}

