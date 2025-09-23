if (!active || !instance_exists(objPlayer))
    exit;
if (instance_exists(objBoss1Die))
    exit;
if (wait > 0) {
    wait--;
    exit
}
if (state == 0) {
    if (objPlayer.x < 128 && objPlayer.y > 456 || point_distance(x, y, objPlayer.x, objPlayer.y) < 64) {
        if (instance_exists(objPlayerMouse)) {
            with (objPlayerMouse) {
                my_id = instance_create(x, y, objPlayerMouseHouse);
                my_id.active = 0;
                my_id.sprite_index = sprite_index;
                my_id.ammo = ammo;
                global.maskon = 1;
                my_id.maskon = 1;
                my_id.maskindex = global.maskindex;
                with (my_id) {
                    scrInitMaskPos();
                    scrUpdateMaskPos(sprite_index);
                }
                instance_destroy();
            }
        }
        if (objPlayer.x < 128 && objPlayer.y > 456)
            scrGetMessage(2);
        else scrGetMessage(3)
        state = 1;
    }
}
if (state == 1) {
    if (!instance_exists(objPhoneConversation)) {
        image_speed = 0;
        state = 2;
        image_index = 0;
        with (objPlayer)
            active = 1;
    } else {
        image_speed = 0.1;
        sprite_index = sprGirlfriendTalk;
    }
}
if (state == 2) {
    global.test = 0;
    pickup = 0;
    if (global.xbox) {
        if (gettrigger_r() > 100 || gettrigger_l() > 100)
            pickup = 1;
    } else {
        if (mouse_check_button_pressed(mb_right) || mouse_check_button(mb_left))
            pickup = 1;
    }
    if (pickup) {
        with (objPlayer) {
            if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objGirlfriend)) {
                if (sprite_index == sprPWalkUnarmed || sprite_index == sprPAttackPunch)
                    noweapon = 1;
                else noweapon = 0;
                if (!noweapon) {
                    my_id = instance_create(x, y, objWeapon);
                    my_id.direction = direction - 45;
                    my_id.speed = 1 + random(1);
                    my_id.friction = 0.2;
                    my_id.image_index = scrCurrentWeapon();
                }
                sprite_index = sprPWalkGirlfriend;
                instance_create(x, y, objGoToCar);
                scrUpdateMaskPos(sprite_index);
                with objDoorV solid = 0;
                global.test = 1;
            }
        }
    }
    if (global.test)
        instance_destroy();
}

