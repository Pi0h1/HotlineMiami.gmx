if (move[select] == "Drop Weapon")||
    move[select] == "Pick Up" ||
    move[select] == "Advance Dialogue" ||
    move[select] == "Skip Dialogue" ||
    move[select] == "Pause Menu" ||
    move[select] == "Quit" ||
    move[select] == "Aim" {
        image_speed = 0;
        image_index = 0;
} else image_speed = 0.2;
if (move[select] == "Finish Enemy" && sprite_index == sprPWalkUnarmed) {
    image_speed = 0;
    image_index = 0;
}
if (move[select] == "Throw Weapon" && sprite_index == sprPWalkUnarmed) {
    image_speed = 0;
    image_index = 0;
}
if (move[select] == "Human Shield" && sprite_index == sprPWalkDoubleBarrel) {
    image_speed = 0;
    image_index = 0;
}
if (sprite_index == sprPAttackPipe) {
    image_speed = 0;
    if (image_index < 8.4)
        image_index += 0.2;
    else {
        image_yscale *= -1;
        image_index = 1;
    }
}
if (move[select] == "Interact") {
    image_speed = 0;
    if (sprite_index == sprPTakePhone) {
        if (image_index < 3)
            image_index += 0.25;
    } else image_index = 0;
}

dir += 0.25;
color2 = merge_color(c_black, merge_color(c_yellow, c_red, 0.5 + lengthdir_x(0.5, dir * 3.12)), 0.5 + lengthdir_x(0.25, dir * 1.13));
color1 = merge_color(c_black, merge_color(merge_color(c_orange, c_maroon, 0.5 + lengthdir_x(0.5, dir * 3.12)), c_olive, 0.125 + lengthdir_y(0.125, dir * 1.73)), 0.35 + lengthdir_y(0.25, dir * 1.73));
d3d_set_projection_ortho(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), 0);
draw_rectangle_color(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + 44, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 43, color1, color1, color2, color2, 0);

global.color3 = merge_color(merge_color(merge_color(c_aqua, c_green, 0.5 + lengthdir_x(0.5, dir * 3.12)), c_lime, 0.125 + lengthdir_y(0.125, dir * 1.73)), merge_color(c_white, c_blue, 0.5 + lengthdir_x(0.3, dir)), 0.5 + lengthdir_x(0.5, dir * 2.33));
draw_set_blend_mode(bm_add);
with (objPalmTree) {
    draw_sprite_general(sprPalmTrees, image_index, 0, 0, 82, 256, room_width / 2 + amount, room_height * 0.5 - (250 * (amount / 240)), amount / 240, (amount / 120), 0, global.color3, global.color3, c_black, c_black, 1);
    draw_sprite_general(sprPalmTrees, image_index, 0, 0, 82, 256, room_width / 2 - amount - (amount / 240) * 82, room_height * 0.5 - (250 * (amount / 240)), -amount / 240, amount / 120, 0, global.color3, global.color3, c_black, c_black, 1);
}

draw_set_blend_mode(bm_normal);
d3d_set_projection_ortho(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), camera_get_view_angle(view_camera[0]));
draw_surface_ext(global.surf1, 0, -1, 1, 1, 0, c_black, 1);
draw_surface_ext(global.surf1, -1, 0, 1, 1, 0, c_black, 1);
draw_surface_ext(global.surf1, 0, 1, 1, 1, 0, c_black, 1);
draw_surface_ext(global.surf1, 1, 0, 1, 1, 0, c_black, 1);
draw_surface_ext(global.surf1, 0, 0, 1, 1, 0, merge_color(c_white, merge_color(c_aqua, c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 3)), 0.25 + lengthdir_x(0.25, dir)), 1);
global.x = x;
global.y = y;
global.dir = mapdir;
with (all) {
    if (sprite_index > 0) {
        if (object_index == objWeapon)
            angle = 0;
        if (object_index == objShowControls) {
            // do nothing
        } else {
            drawdir = point_direction(global.x, global.y, x, y);
            draw_sprite_ext(sprite_index, image_index, global.x + lengthdir_x(point_distance(x, y, global.x, global.y), global.dir + drawdir), global.y + lengthdir_y(point_distance(x, y, global.x, global.y), global.dir + drawdir), image_xscale, image_yscale, global.dir + image_angle + angle, image_blend, image_alpha);
        }
        if (sprite_index == sprDrawersH24Phone) {
            draw_sprite_ext(sprArrow, 0, global.x + lengthdir_x(point_distance(x, y, global.x, global.y), global.dir + drawdir), global.y + lengthdir_y(point_distance(x, y, global.x, global.y), global.dir + drawdir) - 16 + lengthdir_x(4, global.dir * 16), image_xscale, image_yscale, 0, image_blend, image_alpha);
        }
    }
}
draw_sprite_ext(sprite_index, image_index, room_width / 2, room_height / 2, 1, image_yscale, mapdir, c_white, 1);

camera_set_view_angle(view_camera[0], lengthdir_y(3, dir * 3.33));
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
        if (!restart)
            sxeasy_setVolume(c_amount * (1 / 180));
        color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, c_amount)), 0.5 + lengthdir_x(0.5, c_amount));
        if (c_amount > 90)
            color2 = merge_color(c_black, merge_color(c_fuchsia, c_white, abs(lengthdir_y(1, c_amount))), abs(lengthdir_y(1, c_amount)));
        else color2 = c_white;
        draw_set_blend_mode(bm_subtract);
        draw_rectangle_color(camera_get_view_x(view_camera[0]) - 10, camera_get_view_y(view_camera[0]) - 10, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 10, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 10, color2, color1, color1, color2, 0);
        draw_set_blend_mode(bm_normal);
    } else {
        if (!restart) {
            sxeasy_stop();
            sxeasy_setVolume(1);
            sxeasy_play(working_directory + "\\DeepCover.mp3");
            room_goto(global.sequence);
        } else room = rmMenu;
    }
}

d3d_set_projection_ortho(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), 0);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, 44, 0);
draw_rectangle(0, room_height, room_width, room_height - 44, 0);

drawVignette();

