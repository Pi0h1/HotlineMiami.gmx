if (!place_free(x, y))
    speed = 0;

if (speed == 0) {
    if (state == 0) {
        if (wait > 0)
            wait--;
        else {
            if (instance_exists(objPlayerMouse)) {
                with (objPlayerMouse) {
                    my_id = instance_create(x, y, objPlayerMouseHouse);
                    my_id.active = 0;
                    my_id.sprite_index = sprite_index;
                    my_id.ammo = ammo;
                    global.maskon = 1;
                    my_id.maskon = 1;
                    instance_destroy();
                }
            }
            with (objEffector) {
                my_id = instance_create(x, y, objEffectorHouse);
                my_id.amount = 180;
                instance_destroy();
            }
            if (sprite_index == sprAssassinTalk)
                scrGetMessage(2);
            else scrGetMessage(3);
            state = 1;
            wait = 30;
        }
    }

    if (state == 1) {
        if (!instance_exists(objPhoneConversation)) {
            if (wait > 0)
                wait--;
            else {
                with (objPlayerMouseHouse) {
                    my_id = instance_create(x, y, objPlayerMouse);
                    my_id.active = 0;
                    my_id.sprite_index = sprite_index;
                    my_id.ammo = ammo;
                    global.maskon = 1;
                    my_id.maskon = 1;
                    instance_destroy();
                }
                viewx = camera_get_view_x(view_camera[0]);
                viewy = camera_get_view_y(view_camera[0]);
                with (objEffector)
                    instance_destroy();
                my_id = instance_create(x, y, objEffector);
                my_id.blackx = 15;
                my_id.amount = 180;
                camera_set_view_pos(view_camera[0], viewx, viewy);
                state = 2;
            }
        }
    }
}

if (state == 2) {
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 6) {
        with (objPlayer) {
            if (sprite_index == sprPWalkUnarmed || sprite_index == sprPAttackPunch) {
                // do nothing
            } else {
                global.executionx = objPlayer.x;
                global.executiony = objPlayer.y;
                my_id = instance_create(objPlayer.x + lengthdir_x(8, objPlayer.dir + 90), objPlayer.y + lengthdir_y(8, objPlayer.dir + 90), objWeaponThrow);
                my_id.image_index = scrCurrentWeaponExt(sprite_index);
                my_id.direction = dir + 70 + random(40);
                my_id.speed = 1 + random(2);
                my_id.ammo = ammo;
            }
            instance_destroy();
        }
        my_id = instance_create(x, y, objAssassinDie);
        my_id.image_angle = image_angle;
        if (sprite_index == sprAssassinTalk)
            my_id.shot = 0;
        else my_id.shot = 1;
        instance_destroy();
    }
}

