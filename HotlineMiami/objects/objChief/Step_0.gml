if (state == 0) {
    if (wait > 0)
        wait--;
    else {
        if (objEffector.amount >= 180) {
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
            scrGetMessage(0);
            state = 1;
            wait = 30;
        }
    }
}

if (state == 1) {
    if (!instance_exists(objPhoneConversation)) {
        if (sprite_index == sprChiefTalk) {
            image_index = 0;
            image_speed = 0.15;
            sprite_index = sprChiefArm;
        }
        if (wait > 0)
            wait--;
        else {
            state = 2;
            with (objPlayer) {
                my_id = instance_create(x, y, objPlayerMouse);
                my_id.active = 0;
                my_id.sprite_index = sprite_index;
                my_id.ammo = ammo;
                my_id.maskon = 1;
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


if (sprite_index == sprChiefTalk)
    exit;
if (sprite_index == sprChiefArm)
    exit;

if (sprite_index = sprChiefDie)
    exit;

if (hits > 0) {
    if (wait > 0) {
        wait--;
        exit;
    } else {
        wait = 4 - hits;
        blood -= 1 + hits * 0.25;
        if (round(random(4)) == 2) {
            instance_create(x - 8 + random(16), y - 8 + random(16), objBloodSplat);
        }
        if (blood <= 0 || hits > 6) {
            sprite_index = sprChiefDie;
            image_index = 1;
            image_speed = 0.15;
            my_id = instance_create(x, y - 12, objScore);
            my_id.text = "+" + string(((2000 + hits * 20)) * global.factor) + "pts";
            global.myscore += ((2000 + hits * 20)) * global.factor;
            global.killscore += (2000 + hits * 20);
            global.combo++;
            global.combotime = 240;
            global.killx[global.kills] = x;
            global.killy[global.kills] = y;
            global.kills++;
            global.gunkill++;
            my_id = instance_create(x + lengthdir_x(8, direction - 90), y + lengthdir_y(8, direction - 90), objWeaponThrow);
            my_id.direction = direction - 80 - random(20);
            my_id.speed = random(3);
            my_id.image_index = 12;
            my_id.ammo = ammo;
            my_id = instance_create(x + lengthdir_x(8, direction + 90), y + lengthdir_y(8, direction + 90), objWeaponThrow);
            my_id.direction = direction + 80 + random(20);
            my_id.speed = random(3);
            my_id.image_index = 12;
            my_id.ammo = ammo;
            exit;
        }
    }
}




if (!instance_exists(objPlayer))
    alert = 1;
else alert = scrLook(objPlayer.x, objPlayer.y, 4);

if (alert == 0 || alert == 2) {
    direction = scrRotate(direction, point_direction(x, y, objPlayer.x, objPlayer.y), 10);
    if (image_index < 15)
        image_index += 0.25;
    else image_index = 0;
} else {
    if (image_index < 16)
        image_index += 0.25;
}


if (image_index >= 2 && image_index < 7) {
    if (reload > 0) {
        reload--;
        exit;
    }
    reload = 2;
    my_id = instance_create(x + lengthdir_x(27, direction + 20), y + lengthdir_y(27, direction + 20), objEBullet);
    my_id.direction = direction - 4 + random(8);
    my_id.speed = 16;
    my_id.image_angle = my_id.direction;
    audio_play_sound(sndMP5, 0, false);
}

if (image_index >= 10 && image_index < 15) {
    if (reload > 0) {
        reload--;
        exit;
    }
    reload = 2;
    my_id = instance_create(x + lengthdir_x(27, direction - 20), y + lengthdir_y(27, direction - 20), objEBullet);
    my_id.direction = direction - 4 + random(8);
    my_id.speed = 16;
    my_id.image_angle = my_id.direction;
    audio_play_sound(sndMP5, 0, false);
}

