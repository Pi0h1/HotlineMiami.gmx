if (!instance_exists(objPhoneConversation) && talked) {
    if (objPlayer.sprite_index == sprPTakePhone) {
        with (objPlayerMouseHouse) {
            active = 1;
            sprite_index = sprPWalkUnarmed;
            my_id = instance_create(x, y, objPlayerMouse);
            my_id.maskon = 1;
            my_id.maskindex = maskindex;
            global.maskon = 1;
            my_id.sprite_index = sprite_index;
            instance_destroy();
        }
    }
    image_index = 0;
}
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x - 1, y - 1, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

if (instance_exists(objEmpty) && !talked && called) {
    draw_sprite_ext(sprArrow, 0, x, y + 12 + lengthdir_x(3, dir), 1, 1, 180, c_white, 1);
    dir += 4;
}

if (instance_number(objBossgun) == 1) {
    if (wait > 0)
        wait--;
    else {
        if (!on) {
            alarm[0] = 60;
            alarm[1] = 150;
            on = 1;
            with (objPlayerMouse) {
                my_id = instance_create(x, y, objPlayerMouseHouse);
                my_id.maskon = 1;
                my_id.maskindex = maskindex;
                my_id.active = 0;

                global.maskon = 1;
                my_id.sprite_index = sprite_index;
                with (objEffector)
                    instance_destroy();
                my_id = instance_create(x, y, objEffectorHouse);
                my_id.blackx = 0;
                my_id.alpha = 0;
                my_id.amount = 180;
                instance_destroy();
            }
        }

    }
}
dir += 4;

