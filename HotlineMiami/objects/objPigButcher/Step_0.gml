if (sprite_index == sprPigButcherShoot) {
    if (!mouse_check_button(mb_left)) {
        if (image_index > 0.2) {
            image_index -= 0.2;
        } else {
            image_index = 0;
            sprite_index = sprPigButcherWalkMP5;
        }
    }
}
if (room == rmTrainstationDownstairs || room == rmPoliceHQFloor3 || instance_exists(objVan))
    clear = 1;
if (instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objECrawl) + instance_number(objMiscEnemy) + instance_number(objBoss) == 0) {
    test = 1;
    if (room == rmHotelEntrance) {
        if (objFatmanEating.sprite_index == sprFatmanEating || objFatmanEating.sprite_index == sprFatmanEatingGiveUp || objFatmanTelephone.sprite_index == sprFatmanTelephone || objFatmanTelephone.sprite_index == sprFatmanTelephoneGiveUp)
            test = 0;
    }
    if (room == rmHotelSuite) {
        if (objFatmanShit.sprite_index == sprFatmanShit || objFatmanShit.sprite_index == sprFatmanShitGiveUp)
            test = 0;
    }
    if (test == 1) {
        if (!clear && !global.done) {
            clear = 1;
            my_id = instance_create(x, y, objCheckpoint);
            my_id.text = "STAGE CLEAR";

        }
    }
} else clear = 0;
if (room == rmBossClubFloor3) {
    if (instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objECrawl) + instance_number(objMiscEnemy) == 0) {
        my_id = instance_create(x - 5 + random(10), y - 5 + random(10), objClubKeys);
        my_id.direction = random(360) my_id.speed = random(3);
    }
}

global.test = 0;
with (objWeapon) {
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 32)
        global.test = 2;
}
if (place_meeting(x, y, objKnockedOut))
    global.test = 1;
objEffector.action = global.test;

if (throwreload > 0)
    throwreload--;
    
if (keyboard_check_direct(vk_shift)) {
    if (global.maskindex == 7) {
        factor = 2;
    } else factor = 1;
    viewx = objPlayer.x + ((display_mouse_get_x() - display_get_width() * 0.5) * (__view_get( e__VW.WView, 0 ) / display_get_width())) * factor;
    viewy = objPlayer.y + ((display_mouse_get_y() - display_get_height() * 0.5) * (__view_get( e__VW.HView, 0 ) / display_get_height())) * factor;
    viewspeed = point_distance(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, viewx, viewy) * 0.1;
    viewdir = point_direction(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, viewx, viewy);
    __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (lengthdir_x(viewspeed, viewdir)) );
    __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (lengthdir_y(viewspeed, viewdir)) );
    vdist = point_distance(x, y, room_width / 2, room_height / 2);
    vdir = point_direction(room_width / 2, room_height / 2, x, y);
    __view_set( e__VW.Angle, 0, lengthdir_y(vdist * (1 / 160), vdir * 2) );
} else {

    viewspeed = point_distance(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, x + lengthdir_x(24, dir), y + lengthdir_y(24, dir)) * 0.1;
    viewdir = point_direction(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, x + lengthdir_x(24, dir), y + lengthdir_y(24, dir));

    __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (lengthdir_x(viewspeed, viewdir)) );
    __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (lengthdir_y(viewspeed, viewdir)) );

    vdist = point_distance(x, y, room_width / 2, room_height / 2);
    vdir = point_direction(room_width / 2, room_height / 2, x, y);
    __view_set( e__VW.Angle, 0, lengthdir_y(vdist * (1 / 160), vdir * 2) );
}

xview = __view_get( e__VW.XView, 0 );
yview = __view_get( e__VW.YView, 0 );
if (persistent && objEffector.fade) {
    if (place_free(x + addx, y))
        x += addx;
    if (place_free(x, y + addy))
        y += addy;
    if (image_speed == 0)
        image_index += 0.15;
    legindex += 0.4;
    exit;
}

scrPlayerMoveKeyboard();

if (sprite_index == sprPAttackKnife || sprite_index == sprPAttackBat || sprite_index == sprPigButcherAttack || sprite_index == sprPAttackNightStick || sprite_index == sprPAttackPipe || sprite_index == sprPAttackClub || sprite_index == sprPAttackSword || sprite_index == sprPAttackAxe || sprite_index == sprPAttackPool || sprite_index == sprPAttackPoolBroke) || (global.maskindex == 2 && sprite_index == sprPAttackPunch) {
    lastx = x;
    lasty = y;
    global.spacex = lengthdir_x(12, dir);
    global.spacey = lengthdir_y(12, dir);
    x += global.spacex;
    y += global.spacey;
    global.my_id = id;
    with (objGlassPanelH) {
        if (place_meeting(x, y, global.my_id)) {
            if (global.my_id.lasty < y + 2) {
                add = -1;
            } else {
                add = 1;
            }
            i = 0;
            repeat(24) {
                my_id = instance_create(x + i * 1.5, y, objShard);
                my_id.speed = random(5);
                my_id.direction = add * 90 - 8 + random(16);
                i++;
            }
            instance_create(x, y, objGlassPanelHBroken);
            global.shake = 4;
            instance_destroy();
            audio_play_sound(sndGlass1, 0, false);
            audio_play_sound(sndGlass2, 0, false);
            audio_play_sound(sndWeaponHit, 0, false);
        }
    }

    with (objGlassPanelV) {
        if (place_meeting(x, y, global.my_id)) {
            if (global.my_id.lastx < x + 2) {
                add = -1;
            } else {
                add = 1;
            }
            i = 0;
            repeat(24) {
                my_id = instance_create(x, y + i * 1.5, objShard);
                my_id.speed = random(5);
                my_id.direction = 90 + add * 90 - 8 + random(16);
                i++;
            }
            instance_create(x, y, objGlassPanelVBroken);
            global.shake = 4;
            instance_destroy();
            audio_play_sound(sndGlass1, 1, 0);
            audio_play_sound(sndGlass2, 1, 0);
            audio_play_sound(sndWeaponHit, 1, 0);
        }
    }

    x += lengthdir_x(12, dir);
    y += lengthdir_y(12, dir);


    with (objEnemy) {
        if (place_meeting(x, y, objPlayer) || place_meeting(x + global.spacex, y + global.spacey, objPlayer)) {
            mask_index = sprWeaponMask;
            if (scrCollisionLineExt(x, y, objPlayer.lastx, objPlayer.lasty, 4, objSolid, objDoorV, objWallSoftH) || object_index == objEnemyFat) {
                mask_index = sprMask;
                objPlayer.x = objPlayer.lastx;
                objPlayer.y = objPlayer.lasty;
                exit;
            }
            mask_index = sprMask;
            global.shake = 7;
            my_id = instance_create(x, y - 12, objScore);
            if (object_get_parent(object_index) == objEnemyIdle) {
                if (room == rmTrainstationEntrance) {
                    sprite_index = sprEWalkKnife;
                } else sprite_index = choose(sprEWalkShotgun, sprEWalkM16);
            }
            if (sprite_index == sprEWalkUnarmed || sprite_index == sprPoliceWalkUnarmed) {
                my_id.text = "+" + string((100) + 100 * global.factor) + "pts";
                global.myscore += (100) + 100 * global.factor;
                global.boldscore = 100 * global.factor;
                global.killscore += 100;
                global.combo++;
                global.combotime = 240;
                global.killx[global.kills] = x;
                global.killy[global.kills] = y;
                global.kills++;
            } else {
                my_id.text = "+" + string((200) + 200 * global.factor) + "pts";
                global.myscore += (200) + 200 * global.factor;
                global.killscore += 200;
                global.boldscore += 200 * global.factor;
                global.combo++;
                global.combotime = 240;
                global.killx[global.kills] = x;
                global.killy[global.kills] = y;
                global.kills++;
                if (global.bonustime < 12 + global.factor * 4)
                    global.bonustime = 12 + global.factor * 4;
                if (global.factor = 2)
                    ds_list_add(global.bonuslist, "Exposure");
                if (global.factor = 3)
                    ds_list_add(global.bonuslist, "Double Exposure");
                if (global.factor = 4)
                    ds_list_add(global.bonuslist, "Triple Exposure");
                if (global.factor > 4)
                    ds_list_add(global.bonuslist, "Severe Exposure");
            }
            edir = point_direction(objPlayer.lastx, objPlayer.lasty, x, y);
            repeat(8) {
                my_id = instance_create(x - 3 + random(6) + lengthdir_x(8, edir), y - 3 + random(6) + lengthdir_y(8, edir), objBloodDrop);
                my_id.image_xscale = 1 - random(0.2);
                my_id.image_yscale = my_id.image_xscale;
                my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
                my_id.sprite_index = sprBloodSplatSmall;
                my_id.direction = my_id.image_angle;
                my_id.speed = 2 + random(4);
            }
            repeat(2 + random(3)) {
                my_id = instance_create(x - 3 + random(6) + lengthdir_x(8, edir), y - 3 + random(6) + lengthdir_y(8, edir), objBloodDrop);
                my_id.image_xscale = 1 - random(0.2);
                my_id.image_yscale = my_id.image_xscale;
                my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
                my_id.direction = my_id.image_angle;
                my_id.speed = 1 + random(5);
            }
            repeat(4) {
                my_id = instance_create(x - 3 + random(6) + lengthdir_x(16, edir), y - 3 + random(6) + lengthdir_y(16, edir), objBloodSmoke);
                my_id.image_xscale = 1.2 - random(0.2);
                my_id.image_yscale = my_id.image_xscale;
                my_id.image_angle = edir - 20 + random(40);
                my_id.direction = my_id.image_angle;
                my_id.speed = 2 + random(1);
                my_id.friction = 0.15;
            }
            my_id = instance_create(x, y, objDeadBody);
            if (object_index == objDogPatrol) {
                if (objPlayer.sprite_index == sprPAttackClub || objPlayer.sprite_index == sprPAttackBat || sprite_index == sprPigButcherAttack || objPlayer.sprite_index == sprPAttackPipe || objPlayer.sprite_index == sprPAttackPool || sprite_index == sprPAttackPunch) {
                    audio_play_sound(sndHit, 0, false);
                    my_id.sprite_index = sprDogDeadBlunt;
                    my_id.image_index = 3 + floor(random(3));
                } else {
                    my_id.sprite_index = sprDogDeadCut;
                    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
                    my_id.image_index = 4 + floor(random(3));
                }
            } else {
                if (objPlayer.sprite_index == sprPAttackClub || objPlayer.sprite_index == sprPAttackBat || sprite_index == sprPigButcherAttack || objPlayer.sprite_index == sprPAttackPipe || objPlayer.sprite_index == sprPAttackPool || sprite_index == sprPAttackPunch) {
                    audio_play_sound(sndHit, 0, false);
                    my_id.sprite_index = choose(sprEBackBlunt, sprEBackBlunt, sprEFrontBlunt);
                    my_id.image_index = 4 + floor(random(11));
                    if (objPlayer.sprite_index == sprPAttackPool)
                        objPlayer.sprite_index = sprPWalkPoolBroke;
                }
                if (objPlayer.sprite_index == sprPAttackNightStick) {
                    my_id1 = instance_create(x, y, objPoliceHat);
                    my_id1.direction = edir - 10 + random(20);
                    my_id1.speed = 1 + random(2);
                    audio_play_sound(sndHit, 0, false);
                    my_id.sprite_index = choose(sprPoliceBackBlunt, sprPoliceBackBlunt, sprPoliceFrontBlunt) my_id.image_index = floor(random(13));
                }
                if (objPlayer.sprite_index == sprPAttackKnife) {
                    my_id.sprite_index = sprEBackCutl
                    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
                    my_id.image_index = 2 + floor(random(3));
                }
                if (objPlayer.sprite_index == sprPAttackPoolBroke) {
                    my_id.sprite_index = choose(sprEDeadBackPool, sprEDeadBackPool, sprEDeadFrontPool);
                    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
                    my_id.image_index = random(2);
                    objPlayer.sprite_index = sprPWalkUnarmed;
                    objPlayer.image_speed = 0;
                }
                if (objPlayer.sprite_index == sprPAttackSword || objPlayer.sprite_index == sprPAttackAxe) {
                    my_id.sprite_index = sprEBackSlashed;
                    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
                    audio_play_sound(sndHit, 0, false);
                    my_id.image_index = floor(random(4));
                    if (my_id.image_index == 0) {
                        part = instance_create(my_id.x + lengthdir_x(22, edir), my_id.y + lengthdir_y(18, edir), objBodyPart);
                        part.image_angle = edir - 10 + random(20);
                        part.direction = part.image_angle;
                        part.speed = 3 + random(1);
                    }
                    if (my_id.image_index == 1) {
                        part = instance_create(my_id.x + lengthdir_x(12, edir), my_id.y + lengthdir_y(8, edir), objBodyPart);
                        part.image_angle = edir - 10 + random(20);
                        part.direction = part.image_angle;
                        part.speed = 3 + random(1);
                        part.image_index = 1;
                        part.image_yscale = my_id.image_yscale;
                    }
                    if (my_id.image_index == 2) {
                        part = instance_create(my_id.x + lengthdir_x(16, edir), my_id.y + lengthdir_y(12, edir), objBodyPart);
                        part.image_angle = edir - 10 + random(20);
                        part.direction = part.image_angle;
                        part.speed = 3 + random(1);
                        part.image_index = 2;
                        part.image_yscale = my_id.image_yscale;
                    }
                }
            }
            my_id.direction = edir;
            my_id.speed = 1.5 + random(1);
            my_id.image_angle = my_id.direction;
            if (global.pigkill)
                my_id.sprite_index = sprOscarDead;
            global.pigkill = 0;
            if (my_id.sprite_index == sprEBackBlunt && round(random(11)) == 2) {
                with (my_id) {
                    my_id = instance_create(x, y, objECrawl);
                    my_id.direction = direction;
                    my_id.image_angle = direction;
                    global.test = 0;
                    with (my_id) {
                        if (!place_free(x, y)) {
                            global.test = 1;
                            instance_destroy();
                        }
                    }
                    if (global.test == 0)
                        instance_destroy()
                }
            }
            if (sprite_index == sprEWalkUnarmed || sprite_index == sprPoliceWalkUnarmed || object_index == objDogPatrol)
                noweapon = 1;
            else noweapon = 0;
            scrIdleGetEnemy();
            if (!noweapon) {
                my_id = instance_create(x, y, objWeaponThrow);
                my_id.direction = other.direction - 70 + random(40);
                my_id.speed = 2 + random(2);
                my_id.image_index = scrCurrentWeaponExt(sprite_index);
                my_id.ammo = ammo;
            }
            instance_destroy();
        }
    }
    x = lastx;
    y = lasty;
}

if (sprite_index == sprPAttackPunch || sprite_index == sprPAttackBag || sprite_index == sprPAttackDrill) {
    lastx = x;
    lasty = y;
    global.spacex = lengthdir_x(12, dir);
    global.spacey = lengthdir_y(12, dir);
    x += global.spacex;
    y += global.spacey;

    global.my_id = id;
    with (objGlassPanelH) {
        if (place_meeting(x, y, global.my_id)) {
            if (global.my_id.lasty < y + 2) {
                add = -1;
            } else {
                add = 1;
            }
            i = 0;
            repeat(24) {
                my_id = instance_create(x + i * 1.5, y, objShard);
                my_id.speed = random(5);
                my_id.direction = add * 90 - 8 + random(16);
                i++;
            }
            instance_create(x, y, objGlassPanelHBroken);
            global.shake = 2;
            instance_destroy();
            audio_play_sound(sndGlass1, 0, false);
            audio_play_sound(sndGlass2, 0, false);
            audio_play_sound(sndWeaponHit, 0, false);
        }
    }

    with (objGlassPanelV) {
        if (place_meeting(x, y, global.my_id)) {
            if (global.my_id.lastx < x + 2) {
                add = -1;
            } else {
                add = 1;
            }
            i = 0;
            repeat(24) {
                my_id = instance_create(x, y + i * 1.5, objShard);
                my_id.speed = random(5);
                my_id.direction = 90 + add * 90 - 8 + random(16);
                i++;
            }
            instance_create(x, y, objGlassPanelVBroken);
            global.shake = 2;
            instance_destroy();
            audio_play_sound(sndGlass1, 0, false);
            audio_play_sound(sndGlass2, 0, false);
            audio_play_sound(sndWeaponHit, 0, false);
        }
    }

    x += lengthdir_x(12, dir);
    y += lengthdir_y(12, dir);

    with (objEnemy) {
        if (object_index == objDogPatrol || object_index == objEnemyFat)
            valid = 0;
        else valid = 1;
        if (place_meeting(x, y, objPlayer) || place_meeting(x + global.spacex, y + global.spacey, objPlayer)) && (valid == 1) {
            mask_index = sprWeaponMask;
            if (scrCollisionLineExt(x, y, objPlayer.lastx, objPlayer.lasty, 4, objSolid, objDoorV, objWallSoftH)) {
                mask_index = sprMask;
                objPlayer.x = objPlayer.lastx;
                objPlayer.y = objPlayer.lasty;
                exit;
            }
            mask_index = sprMask;
            edir = point_direction(objPlayer.lastx, objPlayer.lasty, x, y);
            audio_play_sound(sndDoorHit, 0, false);
            global.shake = 3;
            my_id = instance_create(x, y, objKnockedOut);
            my_id.type = object_index;
            if (scrIsPolice(object_index))
                my_id.sprite_index = sprPoliceGetUp;
            my_id.direction = edir - 10 + random(20);
            my_id.angle = my_id.direction;
            with (my_id)
                move_outside_solid(angle - 180, 16);
            my_id.speed = 3;
            scrIdleGetEnemy();
            if (sprite_index == sprEWalkUnarmed || sprite_index == sprPoliceWalkUnarmed) {
                noweapon = 1;
            } else noweapon = 0;
            if (!noweapon) {
                global.test = 0;
                with (objEnemy)
                    if (alert == 1)
                        global.test++;
                my_id = instance_create(x, y - 12, objScore);
                my_id.text = "+" + string(200 + 400 * global.factor) + "pts";
                global.myscore += 200 + 400 * global.factor;
                global.boldscore += 200 + 400 * global.factor;
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
        }
    }
    x = lastx;
    y = lasty;
}

