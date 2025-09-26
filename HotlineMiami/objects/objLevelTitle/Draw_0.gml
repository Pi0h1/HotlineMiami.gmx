dir += 0.25;
color2 = c_black;
color1 = merge_color(c_black, merge_color(merge_color(c_purple, c_teal, 0.5 + lengthdir_x(0.5, dir * 3.12)), c_maroon, 0.125 + lengthdir_y(0.125, dir * 1.73)), 0.25 + lengthdir_y(0.25, dir * 1.73));
d3d_set_projection_ortho(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), 0);
draw_rectangle_color(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + 54, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 64, color1, color1, color2, color2, 0);
with objHouse draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
i = 0;
repeat(5) {
    draw_sprite_ext(sprPalmTrees, palmindex[i], palmx[i], room_height + 65, 1, 1, 0, c_black, 1);
    palmx[i] -= 8;
    if (palmx[i] <= -60) {
        palmx[i] = room_width + 60;
        palmindex[i] = floor(random(6));
    }
    i++;
}
d3d_set_projection_ortho(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), camera_get_view_angle(view_camera[0]));
if (surface_exists(global.surf1)) {
    draw_surface_ext(global.surf1, 0, -1, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, -1, 0, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, 1, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 1, 0, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, 0, 1, 1, 0, c_white, 1);
}
camera_set_view_angle(view_camera[0], lengthdir_y(3, dir * 3.33));
d3d_set_projection_ortho(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), 0);

draw_set_color(c_black);
draw_rectangle(0, 0, room_width, 55, 0);
draw_rectangle(0, room_height, room_width, room_height - 65, 0);
d3d_set_projection_ortho(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), 0);
draw_set_font(fntDate);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_color(c_black);
draw_text(room_width / 2, room_height - 58 - 1, string_hash_to_newline(hint[myhint]));
draw_text(room_width / 2, room_height - 58 + 1, string_hash_to_newline(hint[myhint]));
draw_text(room_width / 2 - 1, room_height - 58, string_hash_to_newline(hint[myhint]));
draw_text(room_width / 2 + 1, room_height - 58, string_hash_to_newline(hint[myhint]));
draw_set_color(c_dkgray);
draw_text(room_width / 2, room_height - 58, string_hash_to_newline(hint[myhint]));

if (!fade) {
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

if (fade) {
    if (c_amount > 0) {
        c_amount -= 5;
        color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, c_amount)), 0.5 + lengthdir_x(0.5, c_amount));
        if (c_amount > 90)
            color2 = merge_color(c_black, merge_color(c_fuchsia, c_white, abs(lengthdir_y(1, c_amount))), abs(lengthdir_y(1, c_amount)));
        else color2 = c_white;
        draw_set_blend_mode(bm_subtract);
        draw_rectangle_color(camera_get_view_x(view_camera[0]) - 10, camera_get_view_y(view_camera[0]) - 10, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 10, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 10, color2, color1, color1, color2, 0);
        draw_set_blend_mode(bm_normal);
    } else {
        room_goto(global.level);
        restart_create("restart.dat");
    }
}


drawVignette();

