scrMoveSolidOn();
if (instance_exists(objPlayer)) {
    if (checkreload > 0)
        checkreload--;
    else {
        checkreload = 5;
        check = scrLook(objPlayer.x, objPlayer.y, 4);
        if (check == 0) {
            alert = 1;
            speed = 0;
        }
    }

    if (alert) {
        direction = scrRotate(direction, point_direction(x, y, objPlayer.x, objPlayer.y), 6);
        speed = 0;
        image_speed = 0;
        dist = point_distance(x, y, objPlayer.x, objPlayer.y);
        if (dist < 64) {
            if (!talked) {
                scrGetMessage(0);
                with (objPlayerBiker) {
                    my_id = instance_create(x, y, objPlayerBikerHouse);
                    my_id.dir = dir;
                    my_id.sprite_index = sprBoss2Walk;
                    instance_destroy();
                }
                talked = 1;
            } else {
                if (!instance_exists(objPhoneConversation)) {
                    dir = point_direction(objPlayer.x, objPlayer.y, x, y);
                    direction = dir - 180;
                    if (place_free(x + lengthdir_x(1, dir), y))
                        x += lengthdir_x(1, dir);
                    if (place_free(x, y + lengthdir_y(1, dir)))
                        y += lengthdir_y(1, dir);
                    image_speed = 0.1;
                    if (talked) {
                        with (objPlayerBikerHouse) {
                            my_id = instance_create(x, y, objPlayerBiker);
                            my_id.dir = dir;
                            my_id.sprite_index = sprBoss2Walk;
                            instance_destroy();
                        }
                        talked = 2;
                    }
                }
            }
        }
    }
}

if (!alert) {
    image_speed = speed * 0.1;
    if (!place_free(x + hspeed * 4, y))
        hspeed = -hspeed;
    if (!place_free(x, y + vspeed * 4))
        vspeed = -vspeed;
}

scrMoveSolidOff();
global.my_id = id;
global.test = 0;
with (objPlayer) {
    if (sprite_index == sprBoss2AttackCleaver) {
        if (place_meeting(x + lengthdir_x(16, dir), y + lengthdir_y(16, dir), global.my_id) or place_meeting(x, y, global.my_id))
            global.test = 1;
    }
}
if (global.test) {
    pdir = point_direction(objPlayer.x, objPlayer.y, x, y);
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

    with (objPlayerBiker) {
        my_id = instance_create(x, y, objPlayerBikerHouse);
        my_id.dir = dir;
        my_id.sprite_index = sprBoss2Walk;
        instance_destroy();
    }
    my_id = instance_create(x, y, objDeadBody);
    my_id.direction = point_direction(objPlayer.x, objPlayer.y, x, y);
    my_id.speed = 2;
    my_id.sprite_index = sprCeoDead;
    my_id.image_index = floor(random(4));
    my_id.image_angle = my_id.direction;
    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
    audio_play_sound(sndHit, 0, false);
    instance_destroy();
}

