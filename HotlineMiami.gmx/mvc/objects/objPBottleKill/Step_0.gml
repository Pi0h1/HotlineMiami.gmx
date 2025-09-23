if (image_index < 17) {
    image_index += 0.15;
} else {
    my_id = instance_create(x, y, objDeadBody);
    my_id.image_angle = image_angle;
    my_id.sprite_index = sprEGroundBottle;
    my_id.image_yscale = 1;
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.sprite_index = sprPWalkUnarmed;
    my_id.maskon = global.maskon;
    my_id.maskindex = global.maskindex;
    global.angle = image_angle - 180;
    my_id.reload = 30;
    with (my_id)
        move_outside_solid(global.angle, 16);
    instance_destroy();
    my_id = instance_create(x, y - 12, objScore);
    my_id.text = "+" + string((1000) + 600 * (global.factor)) + "pts";
    global.myscore += (1000) + 600 * (global.factor);
    global.killscore += 200;
    global.boldscore += 800 + 600 * global.factor;
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
if (image_index >= 5 && bled == 0) {
    bled = 1;
    audio_play_sound(sndGlass1, 0, false);
}

if (image_index >= 9 && bled == 1) {
    bled = 2;
    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
    audio_play_sound(sndHit, 0, false);
    repeat(2 + random(3)) {
        instance_create(x + lengthdir_x(13, image_angle - 3) - 1 + random(2), y + lengthdir_y(13, image_angle - 3) - 1 + random(2), objBloodSquirt);
    }
    repeat(4) {
        my_id = instance_create(x + lengthdir_x(13, image_angle - 3) - 1 + random(2), y + lengthdir_y(13, image_angle - 3) - 1 + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
}

if (image_index >= 14 && bled == 2) {
    bled = 3;
    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
    audio_play_sound(sndHit, 0, false);
    repeat(2 + random(3)) {
        instance_create(x + lengthdir_x(13, image_angle - 3) - 1 + random(2), y + lengthdir_y(13, image_angle - 3) - 1 + random(2), objBloodSquirt);
    }
    repeat(4) {
        my_id = instance_create(x + lengthdir_x(13, image_angle - 3) - 1 + random(2), y + lengthdir_y(13, image_angle - 3) - 1 + random(2), objBloodSmoke);
        my_id.direction = random(360);
        my_id.speed = random(3);
        my_id.image_angle = my_id.direction;
    }
}

