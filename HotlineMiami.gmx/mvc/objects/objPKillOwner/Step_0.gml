if (image_index < 82) {
    image_index += 0.15;
} else {
    instance_create(x + lengthdir_x(24, image_angle), y + lengthdir_y(24, image_angle), objBloodPool);
    my_id = instance_create(x, y, objDeadBody);
    my_id.image_angle = image_angle;
    my_id.sprite_index = sprOwnerDead;
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.sprite_index = sprPWalkUnarmed;
    my_id.maskon = global.maskon;
    my_id.maskindex = global.maskindex;
    my_id.reload = 30;
    instance_destroy();
    my_id = instance_create(x, y - 12, objScore);
    my_id.text = "+" + string((600) + 400 * (global.factor)) + "pts";
    global.myscore += (600) + 400 * (global.factor);
    global.killscore += 600;
    global.boldscore += 400 * global.factor;
    global.combotime = 240;
    global.combo++;
    global.killx[global.kills] = x;
    global.killy[global.kills] = y;
    global.kills++;
    ds_list_add(global.bonuslist, "Execution");
    if (global.combotime < 12)
        global.combotime = 12;
    exit;
}
if (wait > 0)
    wait--;
if (round(image_index) == 3 || round(image_index) == 8 || round(image_index) == 13 || round(image_index) == 18 || round(image_index) == 23) && (wait == 0) {
    wait = 10;
    audio_play_sound(choose(sndDoorHit, sndPunch), 0, false);
    if (round(image_index) == 8) {
        my_id2 = instance_create(x + lengthdir_x(34, image_angle - 8), y + lengthdir_y(34, image_angle - 8), objMCHelmet);
        my_id2.sprite_index = sprOwnerGlasses;
        my_id2.direction = image_angle - 70 - random(40);
        my_id2.speed = 1 + random(1);
    }
}

if (round(image_index) == 28 || round(image_index) == 33 || round(image_index) == 38) && (wait == 0) {
    bled = 1;
    wait = 10;
    hurtindex = 1;
    targetindex = 3;
    global.shake = 5;
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(sndPunch, 0, false);
    repeat(2) {
        instance_create(x + lengthdir_x(21, image_angle) - 1 + random(2), y + lengthdir_y(21, image_angle) - 1 + random(2), objBloodSquirt);
    }
    repeat(4) {
        my_id = instance_create(x + lengthdir_x(21, image_angle) - 1 + random(2), y + lengthdir_y(21, image_angle) - 1 + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
}

if (round(image_index) == 46 || round(image_index) == 53 || round(image_index) == 60) && (wait == 0) {
    bled = 1;
    wait = 10;
    hurtindex = 1;
    targetindex = 3;
    global.shake = 5;
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(sndPunch, 0, false);
    repeat(4) {
        instance_create(x + lengthdir_x(21, image_angle) - 1 + random(2), y + lengthdir_y(21, image_angle) - 1 + random(2), objBloodSquirt);
    }
    repeat(6) {
        my_id = instance_create(x + lengthdir_x(21, image_angle) - 1 + random(2), y + lengthdir_y(21, image_angle) - 1 + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
}

if (round(image_index) == 72 && wait == 0) {
    bled = 1;
    wait = 10;
    hurtindex = 1;
    targetindex = 3;
    global.shake = 5;
    audio_play_sound(sndHit, 0, false);
    audio_play_sound(sndPunch, 0, false);
    if (!global.done)
        instance_create(x, y, objLevelComplete);
        global.done = 1;
    repeat(8) {
        instance_create(x + lengthdir_x(21, image_angle) - 1 + random(2), y + lengthdir_y(21, image_angle) - 1 + random(2), objBloodSquirt);
    }
    repeat(12) {
        my_id = instance_create(x + lengthdir_x(21, image_angle) - 1 + random(2), y + lengthdir_y(21, image_angle) - 1 + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
}

