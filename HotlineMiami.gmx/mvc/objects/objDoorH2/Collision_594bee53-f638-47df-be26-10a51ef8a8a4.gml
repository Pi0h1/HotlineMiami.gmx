if (solid)
    exit;
if (other.object_index == objDogPatrol || other.object_index == objEnemyFat || other.object_index == objInspector) {
    swinger = 2;
    if (abs(swingspeed) < 2)
        audio_play_sound(sndDoorOpen, 0, false);
    if (x < other.x && other.y < y) {
        swingspeed = 8;
        exit;
    }
    if (x < other.x && other.y > y) {
        swingspeed = -8;
        exit;
    }
    if (other.y < y + lengthdir_y(32, image_angle - 180))
        swingspeed = 8;
    else swingspeed = -8;
    exit;
}

if (abs(swingspeed) > 3.5) {
    if (swinger == 1 || swinger == 0) {
        if (other.sprite_index == sprEWalkUnarmed || other.sprite_index == sprPoliceWalkUnarmed)
            noweapon = 1;
        else noweapon = 0;
        with (other) {
            if (object_get_parent(object_index) == objEnemyIdle) {
                if (room == rmTrainstationEntrance)
                    sprite_index = sprEWalkBat;
                else sprite_index = choose(sprEWalkShotgun, sprEWalkM16);
                if (sprite_index == sprEWalkShotgun)
                    ammo = 6;
                else ammo = 24;
            }
        }
        audio_play_sound(sndDoorHit, 0, false);
        global.shake = 6;
        if (global.maskindex == 4) {
            my_id = instance_create(other.x, other.y, objDeadBody);
            my_id.sprite_index = choose(sprEBackBlunt, sprEBackBlunt, sprEFrontBlunt);
            my_id.image_index = 4 + round(random(10));
        } else my_id = instance_create(other.x, other.y, objKnockedOut);
        ds_list_add(global.bonuslist, "Door Slam");
        if (global.bonustime < 12)
            global.bonustime = 12;
        if (scrIsPolice(other.object_index)) {
            if (global.maskindex == 4)
                my_id.sprite_index = choose(sprPoliceBackBlunt, sprPoliceBackBlunt, sprPoliceFrontBlunt);
            else my_id.sprite_index = sprPoliceGetUp;
        }
        my_id.type = other.object_index;
        if (swingspeed < 0)
            my_id.direction = 90 - 15 + random(30);
        else my_id.direction = 255 + random(30);
        my_id.angle = my_id.direction;
        my_id.speed = abs(swingspeed) * 0.5;
        if (!noweapon) {
            global.test = 0;
            with (objEnemy)
                if (alert == 1)
                    global.test++;
            my_id = instance_create(x, y - 12, objScore);
            my_id.text = "+" + string(180 + 300 * global.factor) + "pts";
            global.myscore += 180 + 300 * global.factor;
            global.boldscore += 180 + 300 * global.factor;
            global.combotime += 100;
            global.killx[global.kills] = x;
            global.killy[global.kills] = y;
            global.kills++;
            my_id = instance_create(other.x, other.y, objWeaponThrow);
            if (swingspeed < 0)
                my_id.direction = 90 - 15 + random(30) + 25;
            else my_id.direction = 255 + random(30) + 25;
            my_id.speed = 1 + random(2);
            my_id.ammo = other.ammo;
            my_id.image_index = scrCurrentWeaponExt(other.sprite_index);
        }
        with (other)
            instance_destroy();
    }
    exit;
}
swinger = 2;
if (abs(swingspeed) < 2)
    audio_play_sound(sndDoorOpen, 0, false);
if (x < other.x && other.y < y) {
    swingspeed = 8;
    exit;
}
if (x < other.x && other.y > y) {
    swingspeed = -8;
    exit;
}
if (other.y < y + lengthdir_y(32, image_angle - 180))
    swingspeed = 8;
else swingspeed = -8;

