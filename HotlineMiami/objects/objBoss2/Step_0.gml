if (!instance_exists(objPlayer)) {
    speed = 0;
    state = 1000;
}
if (global.xbox)
    scrXboxRestart();
if (energie == 1 && round(random(120)) == 2) {
    instance_create(x - 10 + random(20), y - 10 + random(20), objBloodSplat);
}
if (keyboard_check_pressed(ord(global.restartkey)))
    event_perform(ev_keypress, ord("R"));

if (sprite_index == sprBoss2AttackCleaver) {
    if (place_meeting(x + lengthdir_x(6, direction), y + lengthdir_y(6, direction), objPlayer)) {
        global.my_id = id;
        scrPlayerDieMelee();
        state = 1000;
        speed = 0;
        exit;
    }
}

if (turnwait > 0)
    turnwait--;
if (state == 0) {
    vol -= 0.0019;
    sxeasy_setVolume(vol);
    sprite_index = sprBoss2Computer;
    direction = 0;
    image_index += 0.25;
    with (objDoorV) {
        test = solid;
        solid = 1;
    }
    if (!scrCollisionLineDouble(x, y, objPlayer.x, objPlayer.y, 4, objSolid, objDoorV)) {
        state = 1;
        sprite_index = sprBoss2Walk;
        y -= 4;
        direction = 90;
        image_index = 0;
        with (objPlayer) {
            if (object_index == objPlayerMouse) {
                my_id = instance_create(x, y, objPlayerMouseHouse);
                my_id.sprite_index = sprite_index;
                my_id.maskon = 1;
                my_id.maskindex = global.maskindex;
                instance_destroy();
            }
            sxeasy_stop(0);
            sxeasy_play(working_directory + "\\Release.mp3");
        }
        with (objDoorV) {
            solid = test;
        }
        test = objPlayer.persistent;
        objPlayer.persistent = 0;
        global.loaded = 1;
        legacy_save(working_directory + "\\tempsave.sav");
        global.loaded = 0;
        objPlayer.persistent = test;
    }
    with (objDoorV) {
        solid = test;
    }
}

if (state == 1) {
    with (objPlayer) {
        active = 0;
        if (y < 320) {
            y += 2;
            legdir = 270;
            image_index += 0.17;
            legindex += 0.25;
        } else {
            with (objBoss2) {
                scrGetMessage(0);
                state = 2;
            }
        }
    }
}

if (state == 2) {
    if (!instance_exists(objPhoneConversation)) {
        state = 3;
        pdir = 270;
        with (objPlayer) {
            if (object_index == objPlayerMouseHouse) {
                my_id = instance_create(x, y, objPlayerMouse);
                my_id.sprite_index = sprite_index;
                my_id.maskon = 1;
                my_id.maskindex = global.maskindex;
                instance_destroy();
            }
        }
    }
}


if (state == 3) {
    with (objDoorH) {
        image_angle = 0;
        solid = 1;
    }
    with (objDoorV) {
        image_angle = 0;
        solid = 1;
    }


    if (wait > 0)
        wait--;
    else wait = 700;
    if (wait == 815) {
        sprite_index = sprBoss2WalkCleaver;
        audio_play_sound(sndDrawKnife, 0, false);
    }
    if (wait == 800) {
        image_index = 0;
        image_speed = 0.35;
        attack = 1;
        sprite_index = sprBoss2AttackCleaver;
        audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
        attackwait = 120;
    }
    if (wait = 515) {
        sprite_index = sprBoss2WalkCleaver;
        audio_play_sound(sndDrawKnife, 0, false);
    }
    if (wait == 500) {
        image_index = 0;
        image_speed = 0.35;
        attack = 1;
        sprite_index = sprBoss2AttackCleaver;
        audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
        attackwait = 120;
    }
    if (wait == 315) {
        sprite_index = sprBoss2WalkCleaver;
        audio_play_sound(sndDrawKnife, 0, false);
    }
    if (wait == 300) {
        image_index = 0;
        image_speed = 0.35;
        attack = 1;
        sprite_index = sprBoss2AttackCleaver;
        audio_play_sound(choose(sndSwing1, sndSwing2), 0, false);
        attackwait = 120;
    }
    if (wait == 16) {
        sprite_index = sprBoss2WalkCleaver;
    }
    if (wait == 1) {
        sprite_index = sprBoss2Throw;
        audio_play_sound(sndDrawKnife, 0, false);
        image_index = 1;
        image_speed = 0.35;
        attackwait = 0;
        state = 4;
        wait = 100;
        exit;
    }
    if (sprite_index == sprBoss2WalkCleaver || sprite_index == sprBoss2Throw)
        exit;
    if (sprite_index == sprBoss2Walk) {
        if (place_meeting(x, y, objWeaponThrow)) {
            image_index = 0;
            sprite_index = sprBoss2Dodge;
            image_speed = 0.5;
        }
    }

    if (sprite_index == sprBoss2Dodge)
        attack = 0;
    targetx = objPlayer.x + lengthdir_x(70 - (attack * 70), pdir);
    targety = objPlayer.y + lengthdir_y(70 - (attack * 70), pdir);
    dist = point_distance(x, y, targetx, targety);
    if (attack == 0) {
        if (point_distance(x, y, objPlayer.x, objPlayer.y) < 32) {
            attackwait = 120;
            image_index = 0;
            image_speed = 0.35;
            attack = 1;
            sprite_index = sprBoss2AttackCleaver;
        } else {
            if (attackwait > 0)
                attackwait--;
        }
    }
    dir = point_direction(x, y, targetx, targety);
    myspeed = attack * 3 + dist * 0.1;
    if (myspeed > 3 + attack)
        myspeed = 3 + attack;
    if (sprite_index == sprBoss2Dodge) {
        myspeed = 6;
    }
    if (sprite_index == sprBoss2Walk)
        image_index += myspeed * 0.1;
    direction = point_direction(x, y, objPlayer.x, objPlayer.y);

    lastx = x;
    lasty = y;
    if (place_free(x + lengthdir_x(myspeed, dir), y))
        x += lengthdir_x(myspeed, dir);
    if (place_free(x, y + lengthdir_y(myspeed, dir)))
        y += lengthdir_y(myspeed, dir);
    if (round(x) = round(lastx) and round(y) = round(lasty)) {
        if (turnwait == 0)
            diradd = -diradd;
            turnwait = 20;
    }
    pdir += diradd;
    if (sprite_index == sprBoss2Dodge)
        pdir += diradd * 2;
}


if (state == 4) {
    if (sprite_index == sprBoss2Throw)
        direction = point_direction(x, y, objPlayer.x, objPlayer.y);
    if (image_index >= 2) {
        if (wait > 0) {
            audio_play_sound(sndThrow, 0, false);
            my_id = instance_create(x + lengthdir_x(16, direction), y + lengthdir_y(16, direction), objCleaver);
            my_id.direction = direction;
            my_id.speed = 10;
        }
        wait = 0;
    }

    if (sprite_index == sprBoss2Walk) {
        if (objCleaver.speed == 0) {
            if (objCleaver.bounced == 0) {
                targetx = objCleaver.x + lengthdir_x(14, objCleaver.image_angle + 135);
                targety = objCleaver.y + lengthdir_y(14, objCleaver.image_angle + 135);
            } else {
                targetx = objCleaver.x;
                targety = objCleaver.y;
            }
            direction = point_direction(x, y, targetx, targety);
            speed = 3;
            image_speed = 0.3;
            if (point_distance(x, y, targetx, targety) < 5) {
                with (objCleaver) {
                    if (!bounced) {
                        my_id = instance_create(x, y, objBoss2Pry);
                        my_id.image_angle = image_angle;
                        my_id.energie = objBoss2.energie;
                        instance_destroy();
                        with (objBoss2)
                            instance_destroy();
                    } else {
                        pdir = point_direction(objPlayer.x, objPlayer.y, x, y);
                        objBoss2.state = 3;
                        objBoss2.wait = 700;
                        instance_destroy();
                    }
                }
            }
        }
    }
}

