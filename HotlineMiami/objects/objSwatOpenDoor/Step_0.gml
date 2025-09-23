if (!siren) {
    if (instance_number(objEnemy) + instance_number(objKnockedOut) == 10) {
        siren = 1;
        audio_play_sound(sndPolice, 0, true);
    }
}
if (state = 0) {
    if (instance_number(objEnemy) + instance_number(objKnockedOut) == 3) {
        state = 1;
        vspeed = 1;
        visible = 1;
        with (objLaser)
            on = 1;
    } else exit;
}
if (state == 1) {
    image_index += speed * 0.2;
    if (y >= 72) {
        speed = 0;
        sprite_index = sprSwatSign;
        image_index = 0;
        state = 2;
    }
}
if (state == 2) {
    if (image_index < 20)
        image_index += 0.15;
    else {
        sprite_index = sprSwatKickDoor;
        image_index = 0;
        state = 3;
    }
}
if (state == 3) {
    if (image_index < 9)
        image_index += 0.25;
    else {
        objSwatSpawn.alarm[0] = 1;
        state = 4;
        sprite_index = sprSwatWalkM16;
    }
    if (image_index > 4) {
        with (objDoorH) {
            if (solid && x == 288) {
                if (!global.done) {
                    instance_create(x, y, objLevelComplete);
                    with (objEnemy) {
                        if (scrCantGetHit(object_index)) {
                            // do nothing
                        } else {
                            my_id = instance_create(x, y, objEGiveUp);
                            my_id.image_angle = angle;
                            if (sprite_index == sprEWalkUnarmed || sprite_index == sprEGiveUp) {
                                // do nothing
                            } else {
                                my_id = instance_create(x, y, objWeaponThrow);
                                my_id.direction = random(360);
                                my_id.image_index = scrCurrentWeaponExt(sprite_index);
                                my_id.ammo = ammo;
                            }
                            instance_destroy();
                        }
                    }
                }
                global.done = 1;
                solid = 0;
                audio_play_sound(sndDoorHit, 0, false);
                audio_play_sound(sndPunch, 0, false);
                swingspeed = -12;
                swinger = 2;
            }
        }
    }
}
if (state == 4) {
    global.done = 1;
    if (y < 96) {
        y += 2;
        image_index += 0.2;
    } else {
        my_id = instance_create(x, y, objSwat);
        my_id.direction = 270;
        my_id.diradd = 1;
        instance_destroy();
    }
}

