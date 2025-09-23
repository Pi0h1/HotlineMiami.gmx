if (global.xbox)
    scrXboxAssassinRestart();
if (keyboard_check_pressed(ord(global.restartkey)))
    event_perform(ev_keypress, ord("R"));
if (!instance_exists(objPlayer))
    alert = 1;
else {
    alert = scrLook(objPlayer.x, objPlayer.y, 4);
    if (point_distance(x, y, objPlayer.x, objPlayer.y) > 100)
        alert = 1;
}
if (alert == 0 || alert == 2) {
    if (state == 0) {
        state = 1;
        scrGetMessage(0);
        with (objPlayer)
            active = 0;
    }
    if (state == 1) {
        if (!instance_exists(objPhoneConversation)) {
            audio_play_sound(sndPickupWeapon, 0, false);
            state = 2;
        }
    }
    if (state == 2) {
        direction = scrRotate(direction, point_direction(x, y, objPlayer.x, objPlayer.y), 10);
        if (wait > 0)
            wait--;
        else {
            if (instance_exists(objPlayer)) {
                wait = 2;
                audio_play_sound(sndSilencer, 0, false);
                my_id = instance_create(x + lengthdir_x(16, direction), y + lengthdir_y(16, direction), objBullet);
                my_id.direction = direction - 2 + random(4);
                my_id.image_angle = my_id.direction;
                my_id.speed = 14;

                my_id = instance_create(x + lengthdir_x(16, direction - 4), y + lengthdir_y(16, direction - 4), objShell);
                my_id.sprite_index = sprUziShell;
                my_id.image_angle = direction;
                my_id.direction = direction - 90 - 20 + random(30);
                my_id.speed = 1 + random(3);
                global.shake = 5;
            }
        }
    }
}

