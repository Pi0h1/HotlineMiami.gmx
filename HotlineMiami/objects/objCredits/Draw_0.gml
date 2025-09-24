d3d_set_projection_ortho(0, 0, 400, 256, 0);
draw_rectangle_color(0, 60, room_width, room_height - 60, merge_color(c_black, c_navy, 0.1 + lengthdir_x(0.1, dir * 0.5)), merge_color(c_black, c_navy, 0.1 + lengthdir_x(0.1, dir * 2)), merge_color(c_maroon, c_red, 0.4 + lengthdir_x(0.3, dir * 0.76) + random(0.05)), merge_color(c_maroon, c_red, 0.4 + lengthdir_x(0.3, dir * 0.76) + random(0.05)), 0);
if (!rollcredits)
	camera_set_view_angle(view_camera[0], lengthdir_x(2, dir * 0.2));
else {
    if (topicalpha <= 0.05)
        camera_set_view_angle(view_camera[0], 0);
}
d3d_set_projection_ortho(0, 0, 400, 256, camera_get_view_angle(view_camera[0]));
if (rollcredits) {
    draw_set_font(fntCreditList);
    if (credit_y < string_height(string_hash_to_newline(creditlist)) + 128) {
        if (credits_y < 1)
            credits_y += 0.2;
        else {
            credits_y = 0;
        }
        if (credits_y == 1)
            credit_y +=  1;
    }
}
draw_set_blend_mode(bm_add);
draw_surface_ext(global.surf2, 0, 0, 1 / 3, 1 / 3, 0, merge_color(merge_color(c_fuchsia, c_aqua, 0.5 + lengthdir_x(0.5, dir * 0.4)), merge_color(c_yellow, c_lime, 0.5 + lengthdir_x(0.5, dir)), 0.5 + lengthdir_x(0.5, dir * 0.1)), 0.4);
draw_set_blend_mode(bm_normal);
draw_surface_ext(global.surf1, 0, 1 - frac(credits_y), 1, 1, 0, c_black, 1);
draw_surface_ext(global.surf1, 0, -1 - frac(credits_y), 1, 1, 0, c_black, 1);
draw_surface_ext(global.surf1, 1, 0 - frac(credits_y), 1, 1, 0, c_black, 1);
draw_surface_ext(global.surf1, -1, 0 - frac(credits_y), 1, 1, 0, c_black, 1);
draw_surface_ext(global.surf1, 0, 0 - frac(credits_y), 1, 1, 0, c_white, 1);
d3d_set_projection_ortho(0, 0, 400, 256, 0);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, 60, 0);
draw_rectangle(0, room_height - 60, room_width, room_height, 0);

if (!endfade) {
    if (c_amount < 180) {
        c_amount += 10;
        color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, c_amount)), 0.5 + lengthdir_x(0.5, c_amount));
        if (c_amount > 90)
            color2 = merge_color(c_black, merge_color(c_fuchsia, c_white, abs(lengthdir_y(1, c_amount))), abs(lengthdir_y(1, c_amount)));
        else color2 = c_white;
        draw_set_blend_mode(bm_subtract);
        draw_rectangle_color(camera_get_view_x(view_camera[0]) - 10, camera_get_view_y(view_camera[0]) - 10, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 10, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 10, color1, color2, color2, color1, 0);
        draw_set_blend_mode(bm_normal);
    }
}

if (endfade) {
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
        sxeasy_stop();
        global.parttitle[0] = "PART FIVE.";
        global.parttitle[1] = "ANSWERS.";
        global.nextlevel = rmRewind;
        room_goto(rmPart);
    }
}

d3d_set_projection_ortho(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), 0);
drawVignette();

