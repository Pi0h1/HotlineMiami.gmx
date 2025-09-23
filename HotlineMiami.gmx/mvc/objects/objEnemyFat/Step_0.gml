if (sprite_index == sprEFatDie) {
    if (path_index > 0)
        path_end();
    exit;
}
scrMoveSolidOn();

if (hits > 0) {
    if (wait > 0) {
        wait--;
        exit;
    } else {
        wait = 4 - hits;
        blood -= 1 + hits * 0.25;
        if (round(random(4)) == 2) {
            instance_create(x - 8 + random(16), y - 8 + random(16), objBloodSplat);
        }
        if (blood <= 0 || hits > 6) {
            if (speed > 0) {
                my_id = instance_create(x, y, objDeadBody);
                my_id.direction = direction;
                my_id.speed = speed;
                my_id.sprite_index = sprEFatDead;
                if (shotgunned)
                    my_id.image_index = floor(random(2));
                else my_id.image_index = 2 + floor(random(2));
                my_id.image_angle = my_id.direction;
                instance_destroy();
            } else {
                sprite_index = sprEFatDie;
                image_index = 1;
                image_speed = 0.15;
                speed = 0;
                if (global.enemy == id)
                    global.enemy = -1234;
            }

            my_id = instance_create(x, y - 12, objScore);
            my_id.text = "+" + string(((500 + hits * 20) + 150) * global.factor) + "pts";
            global.myscore += ((500 + hits * 20) + 150) * global.factor;
            global.killscore += (500 + hits * 20);
            global.boldscore += 150;
            global.combo++;
            global.combotime = 240;
            global.killx[global.kills] = x;
            global.killy[global.kills] = y;
            global.kills++;
            global.gunkill++;
            
            if (global.bonustime < 12 + global.factor * 4)
                global.bonustime = 12 + global.factor * 4;
            if (global.factor == 2)
                ds_list_add(global.bonuslist, "Exposure");
            if (global.factor == 3)
                ds_list_add(global.bonuslist, "Double Exposure");
            if (global.factor == 4)
                ds_list_add(global.bonuslist, "Triple Exposure");
            if (global.factor > 4)
                ds_list_add(global.bonuslist, "Severe Exposure");
                
            scrMoveSolidOff();
            exit;
        }
    }
}




if (reload > 0)
    reload--;
if (path_index > 0) {
    if (image_speed < 1)
        image_speed = 0.2;
    if (alert == 0 && path_position == 1)
        path_end();
} else {
    if (image_speed < 1)
        image_speed = speed * 0.1;
    if (!place_free(x, y)) {
        tempdir = direction;
        i = 1;
        while ((!place_free(x + lengthdir_x(4 + i / 20, tempdir), y + lengthdir_y(4 + i / 20, tempdir))) && i < 100) {
            tempdir += 18;
            i++;
        }
        if (i < 100)
            move_outside_solid(tempdir, 4 + i / 20);
    }
}

scrEFatStep();
scrMoveSolidOff();

angle = direction;
if (image_speed >= 0.5) {
    if (place_meeting(x + lengthdir_x(16, angle), y + lengthdir_y(16, angle), objPlayer)) {
        if (scrIsSearching(sprite_index))
            scrStopSearch(sprite_index);
        global.my_id = id;
        scrPlayerDieMelee();
    }
}

