if (!instance_exists(objPlayer))
    alert = 1;
else {
    if (objPlayer.y < 192 && objPlayer.x > 488)
        alert = 0;
    else alert = 1;
}

if (alert == 0 || alert == 2) {
    on = 0;
}

if (on) {
    if (speed > 0)
        image_speed = 0.1;
    else {
        image_speed = 0;
        image_index = 0;
    }
    if (!place_free(x + hspeed, y) && speed > 0) {
        turn = !turn;
        speed = 0;
    } else {
        if (speed == 0) {
            if (turn) {
                if (direction < 180)
                    direction += 10;
                else speed = 0.5;
            }
            if (!turn) {
                if (direction < 350)
                    direction += 10;
                else {
                    direction = 0;
                    speed = 0.5;
                }
            }
        }
    }

} else {
    speed = 0;
    image_speed = 0;
    if (alert == 0 || alert == 2) {
        direction = scrRotate(direction, point_direction(x, y, objPlayer.x, objPlayer.y), 10);

        if (state == 0) {
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
            scrGetMessage(1);
            state = 1;
            wait = 30;
        }

        if (state == 1) {
            if (!instance_exists(objPhoneConversation)) {
                if (wait > 0)
                    wait--;
                else {
                    state = 2;
                    with (objPlayer) {
                        my_id = instance_create(x, y, objPlayerMouse);
                        my_id.active = 1;
                        my_id.sprite_index = sprite_index;
                        my_id.ammo = ammo;
                        my_id.maskon = global.maskon;
                        my_id.maskindex = global.maskindex;
                        instance_destroy();
                    }
                    viewx = __view_get( e__VW.XView, 0 );
                    viewy = __view_get( e__VW.YView, 0 );
                    with (objEffector)
                        instance_destroy();
                    my_id = instance_create(x, y, objEffector);
                    my_id.blackx = 15;
                    my_id.amount = 180;
                    __view_set( e__VW.XView, 0, viewx );
                    __view_set( e__VW.YView, 0, viewy );
                }
            }
        }

    }
}

if (!instance_exists(objPlayer))
    exit;
if (objPlayer.sprite_index == sprPAttackNightStick || objPlayer.sprite_index == sprPAttackPunch) {
    global.test = 0
    with (objPlayer) {
        if (place_meeting(objPlayer.x + lengthdir_x(12, objPlayer.dir), objPlayer.y + lengthdir_y(12, objPlayer.dir), objPrisoner))
            global.test = 1;
    }
    if (global.test) {
        global.shake = 7;
        audio_play_sound(sndHit, 0, false);
        audio_play_sound(sndPunch, 0, false);
        pdir = point_direction(global.my_id.x, global.my_id.y, x, y);
        repeat(8) {
            my_id = instance_create(x - 3 + random(6) + lengthdir_x(8, pdir), y - 3 + random(6) + lengthdir_y(8, pdir), objBloodDrop);
            my_id.image_xscale = 1 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = point_direction(x + lengthdir_x(8, pdir), y + lengthdir_y(8, pdir), my_id.x, my_id.y);
            my_id.sprite_index = sprBloodSplatSmall;
            my_id.direction = my_id.image_angle;
            my_id.speed = 2 + random(4);
        }
        repeat(2 + random(3)) {
            my_id = instance_create(x - 3 + random(6) + lengthdir_x(8, pdir), y - 3 + random(6) + lengthdir_y(8, pdir), objBloodDrop);
            my_id.image_xscale = 1 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = point_direction(x + lengthdir_x(8, pdir), y + lengthdir_y(8, pdir), my_id.x, my_id.y);
            my_id.direction = my_id.image_angle;
            my_id.speed = 1 + random(5);
        }
        repeat(4) {
            my_id = instance_create(x - 3 + random(6) + lengthdir_x(16, pdir), y - 3 + random(6) + lengthdir_y(16, pdir), objBloodSmoke);
            my_id.image_xscale = 1.2 - random(0.2);
            my_id.image_yscale = my_id.image_xscale;
            my_id.image_angle = pdir - 20 + random(40);
            my_id.direction = my_id.image_angle;
            my_id.speed = 2 + random(1);
            my_id.friction = 0.15;
        }
        edir = point_direction(objPlayer.x, objPlayer.y, x, y);
        my_id = instance_create(x, y, objAssassinGround);
        my_id.image_angle = edir;
        my_id.direction = edir;
        my_id.speed = 1;
        instance_destroy();
    }
}

