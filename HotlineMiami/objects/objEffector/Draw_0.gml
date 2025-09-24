if (gridon ) {
    draw_set_alpha(0.25);
    mp_grid_draw(global.grid);
    draw_set_alpha(1);
}
if (instance_exists(objPlayer)) {
    width = display_get_width();
    height = display_get_height();
    factor = 1;
    if (global.xbox) {
        if (checkbutton(0, getid(9))) {
            global.mousex = objPlayer.x + rightthumb_x(0) * 0.009;
            global.mousey = objPlayer.y - rightthumb_y(0) * 0.006;
        } else {
            if (instance_exists(objPlayerShieldMouse)) {
                mousedir = objPlayer.dir;
                if (point_distance(0, 0, rightthumb_x(0), -rightthumb_y(0)) > 12000) {
                    mousedir = point_direction(0, 0, rightthumb_x(0), -rightthumb_y(0));
                } else {
                    if (abs(objPlayer.myxspeed) + abs(objPlayer.myyspeed) > 0.2) {
                        mousedir = point_direction(0, 0, objPlayer.myxspeed, objPlayer.myyspeed);
                    }
                }
                global.mousex = objPlayer.x + lengthdir_x(64, mousedir);
                global.mousey = objPlayer.y + lengthdir_y(64, mousedir);
            } else {
                if (objPlayer.object_index == objPlayerMouse || objPlayer.object_index == objPlayerMouseHouse || objPlayer.object_index == objPlayerBiker || objPlayer.object_index == objPlayerBikerHouse) {
                    global.mousex = objPlayer.x + lengthdir_x(64, objPlayer.dir);
                    global.mousey = objPlayer.y + lengthdir_y(64, objPlayer.dir);
                } else {
                    global.mousex = objPlayer.x global.mousey = objPlayer.y;
                }
            }
        }
    } else {
        if (keyboard_check_direct(vk_shift)) {
            factor = 1.8;
        }
        global.mousex = objPlayer.x + ((display_mouse_get_x() - width * 0.5) * (camera_get_view_width(view_camera[0]) / width)) * factor;
        global.mousey = objPlayer.y + ((display_mouse_get_y() - height * 0.5) * (camera_get_view_height(view_camera[0]) / height)) * factor;
    }
    x = global.mousex;
    y = global.mousey;
    if (instance_exists(global.enemy)) {
        global.mousex = global.enemy.x;
        global.mousey = global.enemy.y;
    } else global.enemy = -1234;
}
if (action > 0) {
    image_blend = merge_color(merge_color(c_aqua, c_fuchsia, 0.5 + lengthdir_x(0.5, global.dir * 3.27)), c_white, 0.5 + lengthdir_y(0.5, global.dir * 1.97));
    draw_sprite_ext(sprCursorAction, action - 1, global.mousex + 1, global.mousey + 1, 1, 1, -camera_get_view_angle(view_camera[0]), c_black, 0.5);
    draw_sprite_ext(sprCursorAction, action - 1, global.mousex, global.mousey, 1, 1, -camera_get_view_angle(view_camera[0]), image_blend, 1);
}

if (room == rmHotelSuite) {
    with (objWindowV) {
        if (sprite_index == sprWindowSill) {
            // do nothing
        } else {
            if (x == 480 && y == 256) {
                draw_sprite_ext(sprArrow, 0, x - 12 + lengthdir_x(3, objBackgroundColor.dir * 32), y + 16, 1, 1, 90, c_white, 1);
            }
        }
    }
}

// Draw cursor.
draw_sprite_ext(sprite_index, image_index, global.mousex + 1, global.mousey + 1, 1, 1, -camera_get_view_angle(view_camera[0]), c_black, 0.5);
draw_set_blend_mode(bm_cursor);
draw_sprite_ext(sprite_index, image_index, global.mousex, global.mousey, 1, 1, -camera_get_view_angle(view_camera[0]), c_cursor, 1);
draw_set_blend_mode(bm_normal);

with (objDiscoLights) {
    d3d_set_projection_ortho(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), 0);
    draw_set_blend_mode(bm_subtract);
    draw_surface(surf, 0, 0);
}
draw_set_blend_mode(bm_normal);
if (!instance_exists(objMaskMenu) && !instance_exists(objPhoneConversation))
    global.time++;
    
// Draw hud
scrDrawHUD();

// Draw mask menu
if (instance_exists(objMaskMenu)) {
    scrDrawMaskMenu();
} else {
    if (leveltitle == "") {
        // do nothing
    } else {
        // Render and animate address of level that displays when level starts
        if (levelshow > 0)
            levelshow -= 1;
        else leveltitle = "";
        draw_set_font(fntDate);
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        if (levelshow > 180)
            draw_set_alpha((240 - levelshow) * (1 / 60));
        if (levelshow < 60)
            draw_set_alpha(levelshow * (1 / 60));
        draw_set_color(c_black);
        draw_text(camera_get_view_width(view_camera[0]) / 2 + 1, camera_get_view_height(view_camera[0]) * 0.7 + 1, string_hash_to_newline(leveltitle));
        draw_set_color(c_white);
        draw_text(camera_get_view_width(view_camera[0]) / 2, camera_get_view_height(view_camera[0]) * 0.7, string_hash_to_newline(leveltitle));
        draw_set_alpha(1);
    }
}

if (!fade) {
    if (amount < 180) {
        color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, amount)), 0.5 + lengthdir_x(0.5, amount));
        if (amount > 90)
            color2 = merge_color(c_black, merge_color(c_fuchsia, c_white, abs(lengthdir_y(1, amount))), abs(lengthdir_y(1, amount)));
        else color2 = c_white;
        draw_set_blend_mode(bm_subtract);
        draw_rectangle_color(-10, -10, camera_get_view_width(view_camera[0]) + 10, camera_get_view_height(view_camera[0]) + 10, color1, color2, color2, color1, 0);
        draw_set_blend_mode(bm_normal);
    }
}

if (fade) {
    color1 = merge_color(c_black, merge_color(c_aqua, c_white, 0.5 + lengthdir_x(0.5, amount)), 0.5 + lengthdir_x(0.5, amount));
    if (amount > 90)
        color2 = merge_color(c_black, merge_color(c_fuchsia, c_white, abs(lengthdir_y(1, amount))), abs(lengthdir_y(1, amount)));
    else color2 = c_white;
    draw_set_blend_mode(bm_subtract);
    draw_rectangle_color(-10, -10, camera_get_view_width(view_camera[0]) + 10, camera_get_view_height(view_camera[0]) + 10, color2, color1, color1, color2, 0);
    draw_set_blend_mode(bm_normal);
}
coldir++;

scrDrawPlayer();

// Render Oscar Darkness
if (global.maskindex == 14 && global.maskon) {
    draw_set_blend_mode(bm_subtract);
    draw_circle_color(camera_get_view_width(view_camera[0]) / 2, camera_get_view_height(view_camera[0]) / 2, 240 + 24 + random(24) + 24, merge_color(c_black, merge_color(c_white, c_aqua, 0.6 + lengthdir_x(0.4, global.dir * 4)), bamount), merge_color(c_black, c_white, bamount), 0);
    draw_set_blend_mode(bm_normal);
    if (bamount < 1)
        bamount += 0.05;
}

draw_set_blend_mode(bm_subtract);
draw_circle_color(camera_get_view_width(view_camera[0]) / 2, camera_get_view_height(view_camera[0]) / 2, 240 + 24 + random(24) + 24, c_black, merge_color(c_navy, c_aqua, 0.25 + random(0.25)), 0);
draw_set_blend_mode(bm_normal);
if (instance_exists(objPlayerMouse)) {
	camera_set_view_pos(view_camera[0], vlastx, vlasty);
}

if (blackx > 0) {
    draw_set_color(c_black);
    draw_rectangle(0, 0, camera_get_view_width(view_camera[0]), blackx, 0);
    draw_rectangle(0, camera_get_view_height(view_camera[0]), camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]) - blackx * 1.5, 0);
    blackx -= 3;
}

