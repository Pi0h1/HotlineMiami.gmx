dir += 0.25;
color2 = make_color_hsv(0, 255, 15);
color1 = merge_color(c_yellow, merge_color(merge_color(c_fuchsia, c_red, 0.5 + lengthdir_x(0.5, dir * 3.12)), c_maroon, 0.125 + lengthdir_y(0.125, dir * 1.73)), 0.5 + lengthdir_y(0.5, dir * 1.73));
d3d_set_projection_ortho(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), 0);
draw_rectangle_color(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + 40, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 40, color2, color2, color1, color1, 0);
draw_set_blend_mode(bm_subtract);
draw_rectangle_color(camera_get_view_x(view_camera[0]), camera_get_view_height(view_camera[0]) - 39, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 50, c_black, c_black, c_white, c_white, 0);
draw_set_blend_mode(bm_normal);
with (objHouseReturn)
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
i = 0;
repeat(5) {
    draw_sprite_ext(sprPalmTrees, palmindex[i], palmx[i], room_height + 65, 1, 1, 0, c_black, 1);
    palmx[i] += 8;
    if (palmx[i] >= room_width + 60) {
        palmx[i] = -60 palmindex[i] = floor(random(6));
    }
    i++;
}

if (factor > 0) {
    draw_set_blend_mode(bm_subtract);
    i = 0;
    repeat(9) {
        color1 = merge_color(c_black, c_white, 0.5 + lengthdir_x(0.4, 180 - factor * 180) + lengthdir_x(0.1, dir * 16 + i * 90));
        draw_rectangle_color(100 + lengthdir_x(32, dir * 16 + i * 90) * factor, camera_get_view_height(view_camera[0]) - 79 + i * 5, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]) - 79 + i * 5 - 3, c_black, color1, color1, c_black, 0);
        i++;
    }
    draw_set_blend_mode(bm_normal);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_set_font(fntDate);
    text = string(nextgun - leftgun) + " POINTS UNTIL NEXT WEAPON UNLOCK";
    if global.newguns > 0 text = "NEW WEAPON UNLOCKED!";
    if (allguns)
        text = "";
    else {
        draw_set_color(merge_color(c_yellow, c_orange, 0.5 + lengthdir_x(0.5, dir * 5)));
        draw_text(camera_get_view_width(view_camera[0]) / 2, camera_get_view_height(view_camera[0]) - 24, string_hash_to_newline(text));
        draw_set_color(merge_color(c_orange, c_yellow, 0.5 + lengthdir_x(0.5, dir * 5)));
        draw_text(camera_get_view_width(view_camera[0]) / 2 + 1, camera_get_view_height(view_camera[0]) - 24 + 1, string_hash_to_newline(text));
    }
}

d3d_set_projection_ortho(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), camera_get_view_angle(view_camera[0]));


if (surface_exists(global.surf1)) {
    draw_surface_ext(global.surf1, -1, 0, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 1, 0, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, -1, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, 1, 1, 1, 0, c_black, 1);
    draw_surface_ext(global.surf1, 0, 0, 1, 1, 0, c_white, 1);
}
d3d_set_projection_ortho(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), 0);
camera_set_view_angle(view_camera[0], lengthdir_y(2, dir * 2.33));
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
        next = rmScoreDetails;
        room_goto(next);
    }

}



d3d_set_projection_ortho(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), 0);
draw_set_color(c_black);
//draw_rectangle(0,0,room_width,55,0);
//draw_rectangle(0,room_height,room_width,room_height-65,0);
drawVignette();

