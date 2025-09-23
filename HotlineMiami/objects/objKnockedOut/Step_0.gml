scrMoveSolidOn();

if (sprite_index == sprEGetUpLean || sprite_index == sprPoliceGetUpLean) {
    mask_index = sprEGetUpLeanMask;
    if (place_meeting(x, y, objBullet)) {
        audio_play_sound(sndHit, 0, false);
        audio_play_sound(sndPunch, 0, false);
        global.shake = 5;
        myx = x + lengthdir_x(8, image_angle);
        myy = y + lengthdir_y(8, image_angle);
        repeat(8) {
            dir = random(360);
            my_id = instance_create(myx + lengthdir_x(4, dir), myy + lengthdir_y(4, dir), objBloodSmoke);
            my_id.direction = dir;
            my_id.speed = 2 + random(1);
            my_id.friction = 0.1;
        }
        my_id = instance_create(x, y - 12, objScore);
        my_id.text = "+" + string((100) + 100 * global.factor) + "pts";
        global.myscore += (100) + 100 * global.factor;
        global.boldscore = 100 * global.factor;
        global.killscore += 100;
        global.combo++;
        global.combotime = 240;
        global.killx[global.kills] = x;
        global.killy[global.kills] = y;
        global.kills++;
        global.shake = 7;
        my_id = instance_create(x, y, objDeadBody);
        my_id.sprite_index = sprEDeadLean;
        my_id.image_index = 1 + floor(random(5));
        my_id.image_angle = angle;
        instance_destroy();
        scrMoveSolidOff();
        exit;
    }
    if (instance_exists(objPlayer)) {
        if (objPlayer.sprite_index == sprPAttackClub ||
            objPlayer.sprite_index == sprPAttackCrowbar ||
            objPlayer.sprite_index == sprPAttackMachete ||
            objPlayer.sprite_index == sprBoss2AttackCleaver ||
            objPlayer.sprite_index == sprPAttackSledgeHammer ||
            objPlayer.sprite_index == sprPAttackPot ||
            objPlayer.sprite_index == sprPAttackPan ||
            objPlayer.sprite_index == sprPigButcherAttack ||
            objPlayer.sprite_index == sprPAttackBat ||
            objPlayer.sprite_index == sprPAttackPipe ||
            objPlayer.sprite_index == sprPAttackKnife ||
            objPlayer.sprite_index == sprPAttackSword) {
            
            addx = lengthdir_x(12, objPlayer.dir);
            addy = lengthdir_y(12, objPlayer.dir);
            objPlayer.x += addx;
            objPlayer.y += addy;
            
            if (place_meeting(x, y, objPlayer)) {
                audio_play_sound(sndHit, 0, false);
                audio_play_sound(sndPunch, 0, false);
                myx = x + lengthdir_x(8, image_angle);
                myy = y + lengthdir_y(8, image_angle);
                repeat(8) {
                    dir = random(360);
                    my_id = instance_create(myx + lengthdir_x(4, dir), myy + lengthdir_y(4, dir), objBloodSmoke);
                    my_id.direction = dir;
                    my_id.speed = 2 + random(1);
                    my_id.friction = 0.1;
                }
                my_id = instance_create(x, y - 12, objScore);
                my_id.text = "+" + string((100) + 100 * global.factor) + "pts";
                global.myscore += (100) + 100 * global.factor;
                global.boldscore = 100 * global.factor;
                global.killscore += 100;
                global.combo++;
                global.combotime = 240;
                global.killx[global.kills] = x;
                global.killy[global.kills] = y;
                global.kills++;
                global.shake = 7;
                my_id = instance_create(x, y, objDeadBody);
                my_id.sprite_index = sprEDeadWall;
                my_id.image_index = 3 + floor(random(6));
                my_id.image_angle = angle;
                my_id.image_yscale = objPlayer.left;
                instance_destroy();
                scrMoveSolidOff();
                objPlayer.x -= addx;
                objPlayer.y -= addy;
                exit;
            }
            objPlayer.x -= addx;
            objPlayer.y -= addy;
        }
    }

    mask_index = sprMask;
}
if (image_speed > 0)
    exit;
if (!place_free(x, y)) {
    if (speed > 0)
        move_outside_solid(direction - 180, 8);
    else {
        if (place_free(x + lengthdir_x(7, direction - 180), y + lengthdir_y(7, direction - 180))) {
            dir = direction;
            if (sprite_index == sprEGetUp)
                sprite_index = sprEGetUpLean;
            direction = round(direction * (1 / 90)) * 90;
            if (place_free(x + lengthdir_x(5, direction), y + lengthdir_y(5, direction))) {
                direction = dir;
                if (sprite_index == sprEGetUpLean)
                    sprite_index = sprEGetUp;
                if (sprite_index == sprPoliceGetUpLean)
                    sprite_index = sprPoliceGetUp;
            }
        }
    }
    speed = 0;
} else {
    if (!place_free(x + lengthdir_x(5, direction), y + lengthdir_y(5, direction))) {
        move_contact_solid(direction, 8);
        dir = direction;
        if (sprite_index == sprEGetUp)
            sprite_index = sprEGetUpLean;
        direction = round(direction * (1 / 90)) * 90;
        if (place_free(x + lengthdir_x(5, direction), y + lengthdir_y(5, direction))) {
            direction = dir;
            if (sprite_index == sprEGetUpLean)
                sprite_index = sprEGetUp;
            if (sprite_index == sprPoliceGetUpLean)
                sprite_index = sprPoliceGetUp;
        }
    }
}
scrMoveSolidOff();
if (speed == 0) {
    if (reload > 0)
        reload--;
    else {
        image_speed = 0.35;
    }
}

angle = direction;

