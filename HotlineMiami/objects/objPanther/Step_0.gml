if (speed > 0)
    image_angle = direction + 90;
if (!instance_exists(objPlayer)) {
    speed = 0;
    if (sprite_index == sprPantherRun || sprite_index == sprPantherWalk) {
        sprite_index = sprPantherSit;
        image_speed = 0.075;;
    }
    speed = 0;
    exit;
}

if (state == 1) {
    sprite_index = sprPantherWalk;
    depth = 0;
    if (pwait > 0)
        pwait--;
    else {
        mask_index = sprWeaponMask;
        if (!scrCollisionLineDouble(x, y, objPlayer.x, objPlayer.y, 4, objSolid, objFurniture)) {
            direction = point_direction(x, y, objPlayer.x, objPlayer.y);
            if (speed < 1)
                speed += 0.2;
            image_speed = speed * 0.1;
            if (point_distance(x, y, objPlayer.x, objPlayer.y) < 12) {
                global.my_id = id;
                scrPlayerDiePantherBite();
                instance_destroy();
                exit;
            }
        } else {
            speed = 0;
            sprite_index = sprPantherSit;
            image_index += 0.1;
        }
        mask_index = sprMask;
    }
    if (wait > 0)
        wait--;
    else state = 2;
}

if (state == 2) {
    sprite_index = sprPantherRun;
    if (pwait > 0)
        pwait--;
    else {
        mask_index = sprWeaponMask;
        if (!scrCollisionLineDouble(x, y, objPlayer.x, objPlayer.y, 4, objSolid, objFurniture)) {
            direction = point_direction(x, y, objPlayer.x, objPlayer.y);
            speed = 5;
            image_speed = speed * 0.1;
            if (point_distance(x, y, objPlayer.x, objPlayer.y) < 12) {
                global.my_id = id;
                scrPlayerDiePantherBite();
                instance_destroy();
                exit;
            }
        } else {
            speed = 0;
            sprite_index = sprPantherSit;
            image_index += 0.1;
        }
        mask_index = sprMask;
    }
}

if (state >= 1 && state < 3) {
    if (objPlayer.sprite_index == sprPAttackTrophy) {
        with (objPlayer) {
            addx = lengthdir_x(8, dir);
            addy = lengthdir_y(8, dir);
            x += addx;
            y += addy;
        }
        if (place_meeting(x, y, objPlayer) || place_meeting(x - objPlayer.addx, y - objPlayer.addy, objPlayer)) {
            path_end();
            if (energie == 0) {
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
                audio_play_sound(sndDoorHit, 0, false);
                audio_play_sound(sndHit, 0, false);
                global.shake = 10;
                my_id = instance_create(x, y, objDeadBody);
                my_id.image_angle = direction + 90;
                my_id.sprite_index = sprPantherDead;
                my_id.image_index = floor(random(3));
                instance_destroy();
            } else {

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

                energie--;
                speed = 0;
                sprite_index = sprPantherHitback;
                image_index = 0;
                image_speed = 0;
                hit = 0;
                audio_play_sound(sndHit, 0, false);
                audio_play_sound(sndHitWall, 0, false);
                state = 3;
            }
        }

        with (objPlayer) {
            x -= addx;
            y -= addy;
        }
    }
}


if (state == 3) {
    path_end();
    if (wait > 0)
        wait--;
    else {
        if (image_index < 14)
            image_index += 0.5;
        else {
            state = 1;
            sprite_index = sprPantherWalk;
            exit;
        }
        if (image_index > 7 && !hit) {
            hit = 1;
            audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
        }
        if (image_index > 8 && place_meeting(x + lengthdir_x(8, direction), y + lengthdir_y(8, direction), objPlayer)) {
            global.my_id = id;
            global.shake = 10;
            scrPlayerDieMelee();
        }
    }
}

