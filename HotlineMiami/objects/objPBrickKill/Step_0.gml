if (global.xbox)
    scrXboxBrickKill();
if (hurtindex == 15) {
    if (image_index == 0) {
        my_id = instance_create(x, y, objPlayerMouse);
        my_id.sprite_index = sprPWalkThrow;
        my_id.throwindex = 3;
        my_id.maskon = global.maskon;
        my_id.maskindex = global.maskindex;
        global.angle = image_angle - 180;
        my_id.reload = 10;
        with (my_id)
            move_outside_solid(global.angle, 16);
        my_id = instance_create(x + lengthdir_x(11, image_angle), y + lengthdir_y(11, image_angle), objBloodPool);
        my_id = instance_create(x, y, objDeadBody);
        my_id.sprite_index = sprEBrickKill;
        my_id.image_index = 15;
        my_id.image_angle = image_angle;

        instance_destroy();
        my_id = instance_create(x, y - 12, objScore);
        my_id.text = "+" + string((1000) + 400 * (global.factor)) + "pts";
        global.myscore += (1000) + 400 * (global.factor);
        global.killscore += 200;
        global.boldscore += 800 + 400 * global.factor;
        global.combotime = 240;
        global.combo++;
        global.killx[global.kills] = x;
        global.killy[global.kills] = y;
        global.kills++;
        ds_list_add(global.bonuslist, "Execution");
        if (global.combotime < 12)
            global.combotime = 12;
    }
}

