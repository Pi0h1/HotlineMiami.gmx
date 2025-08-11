if (gettrigger_r() > 100) {
    if (!pressrtrig) {
        pressrtrig = 1;
        if (image_index == 3) {
            audio_play_sound(sndWeaponHit, 0, false);
            global.shake = 3;
            if (energie > 0) {
                energie--;
                image_index = 0;
            } else {
                audio_play_sound(sndHit, 0, false);
                audio_play_sound(sndPunch, 0, false);
                global.shake = 5;
                myx = x + lengthdir_x(20, image_angle);
                myy = y + lengthdir_y(24, image_angle);
                my_id = instance_create(myx, myy, objBloodPool);
                my_id = instance_create(x, y, objDeadBody);
                my_id.sprite_index = sprBodyguardDead;
                my_id.image_index = floor(random(4));
                my_id.image_angle = image_angle;
                my_id = instance_create(x, y, objPlayerMouse);
                my_id.reload = 30;
                global.dir = image_angle - 180;
                with (my_id)
                    move_outside_solid(global.dir, 16);
                instance_destroy();
            }
        }
    }
} else pressrtrig = 0;
