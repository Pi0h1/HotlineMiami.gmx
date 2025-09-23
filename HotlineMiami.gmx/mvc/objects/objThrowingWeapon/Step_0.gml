angle += speed * 5 * diradd;
if (speed <= 0) {
    my_id = instance_create(x, y, objWeapon);
    my_id.image_angle = angle;
    my_id.image_index = 27 + image_index;
    my_id.image_yscale = left;
    my_id.ammo = ammo;
    instance_destroy();
}

if (speed > 2.5) {
    mask_index = sprite_index;
    global.my_id = id;
    with (objEnemy) {
        if (scrCantGetHit(object_index)) {
            // do nothing
        } else {
            if (place_meeting(x, y, global.my_id)) {
                if (global.my_id.image_index = 0 || global.my_id.image_index == 4) {
                    scrKnifeThrowHits();
                    ds_list_add(global.bonuslist, "Projectile Kill");
                    if (global.bonustime < 20)
                        global.bonustime = 20;
                    exit;
                }
                if (global.my_id.image_index == 1 && global.my_id.image_index == 2) {
                    with (global.my_id) {
                        direction = direction + 160 + random(40);
                        speed *= 0.3;
                    }
                    audio_play_sound(sndDoorHit, 0, false);
                    my_id = instance_create(x, y, objKnockedOut);
                    global.shake = 5;
                    my_id.type = object_index;
                    my_id.direction = global.my_id.direction - 10 + random(20);
                    my_id.angle = my_id.direction;
                    with (my_id)
                        move_outside_solid(angle - 180, 16);
                    my_id.speed = global.my_id.speed * 0.25;
                    global.my_id.speed *= -0.8;
                    if (sprite_index == sprEWalkUnarmed)
                        noweapon = 1;
                    else noweapon = 0;
                    if (!noweapon) {
                        global.test = 0;
                        with (objEnemy)
                            if (alert == 1) {
                                global.test++;
                            }
                        my_id = instance_create(x, y - 12, objScore);
                        my_id.text = "+" + string(500 * global.factor) + "pts";
                        global.myscore += (500 * global.factor);
                        global.boldscore += (500 * global.factor);
                        global.combotime += 100;
                        global.killx[global.kills] = x;
                        global.killy[global.kills] = y;
                        global.kills++;
                        my_id = instance_create(x, y, objWeaponThrow);
                        my_id.direction = direction - 70 + random(40);
                        my_id.image_index = scrCurrentWeaponExt(sprite_index);
                        my_id.speed = 2 + random(2);
                        my_id.ammo = ammo;
                    }
                    instance_destroy();
                    exit;
                }

                if (global.my_id.image_index == 3 || global.my_id.image_index == 5) {
                    audio_play_sound(sndDoorHit, 0, false);
                    audio_play_sound(sndHit, 0, false);
                    global.my_id.hits++;
                    scrEnemyDieMelee(global.my_id.hits);
                    global.shake = 6;
                    if (global.my_id.image_index == 3 && global.my_id.bounce)
                        SteamSetAchievement("ACH_PLAYING_POOL");
                    if (global.bonustime < 20)
                        global.bonustime = 10;
                    if (global.my_id.hits >= 2) {
                        if (global.my_id.hits == 2) {
                            ds_list_add(global.bonuslist, "Double Hit");
                            SteamSetAchievement("ACH_TWO_BIRDS_WITH_ONE_STONE");
                        }
                        if (global.my_id.hits == 3) {
                            ds_list_add(global.bonuslist, "Triple Hit");
                            SteamSetAchievement("ACH_PLAIN_LUCK");
                        }
                        if (global.my_id.hits >= 4) {
                            ds_list_add(global.bonuslist, "Multi Hit");
                            SteamSetAchievement("ACH_PLAIN_LUCK");
                        }
                    } else ds_list_add(global.bonuslist, "Projectile Kill");
                    exit;
                }



                if (global.my_id.image_index == 6) {
                    if (sprite_index == sprEWalkUnarmed) {
                        // do nothing
                    } else {
                        my_id = instance_create(x, y - 12, objScore);
                        my_id.text = "+" + string(500 * global.factor) + "pts";
                        global.myscore += (500 * global.factor);
                        global.boldscore += (500 * global.factor);
                        global.combotime += 100;
                        global.killx[global.kills] = x;
                        global.killy[global.kills] = y;
                        global.kills++;
                        my_id = instance_create(global.my_id.x, global.my_id.y, objBloodSmoke);
                        my_id.image_angle = global.my_id.image_angle - 180;
                        global.shake = 3;
                        ds_list_add(global.bonuslist, "Big Balls");
                        if (global.bonustime < 32)
                            global.bonustime = 32;
                    }
                }


            }
        }
    }
}
mask_index = sprWeaponMask;

