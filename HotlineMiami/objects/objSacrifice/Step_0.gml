if (instance_exists(objEnemy) || instance_exists(objKnockedOut) || instance_exists(objLevelComplete))
    exit;
if (!instance_exists(objPlayer))
    exit;

if (state == 0) {
    if (instance_exists(objPlayerMouse)) {
        with (objEffector) {
            my_id = instance_create(x, y, objEffectorHouse);
            my_id.amount = 180;
            instance_destroy();
        }
        with (objPlayerMouse) {
            my_id = instance_create(x, y, objPlayerMouseHouse);
            my_id.active = 0;
            my_id.sprite_index = sprite_index;
            my_id.ammo = ammo;
            global.maskon = 1;
            my_id.maskon = 1;
            instance_destroy();
        }
        scrGetMessage(0);
        state = 1;
        instance_create(x, y, objFocus);
        wait = 20;
    }
}

if (state == 1) {
    if (!instance_exists(objPhoneConversation)) {
        if (wait > 0)
            wait--;
        else {
            scrGetMessage(1);
            state = 2;
            wait = 20;
        }
    }
}


if (state == 2) {
    if (!instance_exists(objPhoneConversation)) {
        if (wait > 0)
            wait--;
        else {
            scrGetMessage(2);
            state = 3;
            wait = 20;
        }
    }
}

if (state == 3) {
    if (!instance_exists(objPhoneConversation)) {
        state = 4;
        with (objPlayer) {
            my_id = instance_create(x, y, objPlayerMouse);
            my_id.active = 0;
            my_id.sprite_index = sprite_index;
            my_id.ammo = ammo;
            my_id.maskon = 1;
            my_id.maskindex = global.maskindex;
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
        with (objFocus)
            instance_destroy();

    }
}

