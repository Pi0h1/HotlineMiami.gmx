if (instance_exists(objPlayer)) {
    width = display_get_width();
    height = display_get_height();
    if (global.xbox) {
        if (checkbutton(0, getid(9))) {
            global.mousex = objPlayer.x + rightthumb_x(0) * 0.009;
            global.mousey = objPlayer.y - rightthumb_y(0) * 0.006;
        } else {
            if (objPlayer.object_index == objPlayerMouse || objPlayer.object_index == objPlayerMouseHouse || objPlayer.object_index == objPlayerBiker || objPlayer.object_index == objPlayerBikerHouse || objPlayer.object_index == objPlayerHospital) {
                global.mousex = objPlayer.x + lengthdir_x(64, objPlayer.dir);
                global.mousey = objPlayer.y + lengthdir_y(64, objPlayer.dir);
            } else {
                global.mousex = objPlayer.x;
                global.mousey = objPlayer.y;
            }
        }
    } else {
        factor = 1;
        if (keyboard_check_direct(vk_shift))
            factor = 1.8;
        global.mousex = objPlayer.x + ((display_mouse_get_x() - width * 0.5) * (camera_get_view_width(view_camera[0]) / width)) * factor;
        global.mousey = objPlayer.y + ((display_mouse_get_y() - height * 0.5) * (camera_get_view_height(view_camera[0]) / height)) * factor;
    }
    x = global.mousex;
    y = global.mousey;
}

if (!instance_exists(objPhoneConversation)) {
    draw_sprite_ext(sprite_index, image_index, global.mousex + 1, global.mousey + 1, 1, 1, -camera_get_view_angle(view_camera[0]), c_black, 0.5);
    draw_set_blend_mode(bm_add);
    draw_sprite_ext(sprite_index, image_index, global.mousex, global.mousey, 1, 1, -camera_get_view_angle(view_camera[0]), c_white, 1);
    draw_set_blend_mode(bm_normal);
}

drawVignette();

