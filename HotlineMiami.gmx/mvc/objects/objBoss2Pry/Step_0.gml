if (objPlayer.sprite_index == sprPAttackClub) {
    global.test = 0;
    with (objPlayer) {
        if (place_meeting(x + lengthdir_x(16, dir), y + lengthdir_y(16, dir), objBoss2Pry))
            global.test = 1;
    }
    if (global.test) {
        audio_play_sound(sndHit, 0, false);
        audio_play_sound(sndHitWall, 0, false);
        global.shake = 5;
        if (energie >= 2) {
            my_id = instance_create(x + lengthdir_x(14, image_angle + 135), y + lengthdir_y(14, image_angle + 135), objBoss2GetUp);
            my_id.image_angle = point_direction(objPlayer.x, objPlayer.y, my_id.x, my_id.y);
            my_id.energie = energie - 1;
            if (energie == 3) {
                with (my_id) {
                    repeat(16) {
                        my_id = instance_create(x - 5 + random(10), y - 5 + random(10), objTinyShard);
                        my_id.direction = point_direction(x, y, my_id.x, my_id.y);
                        my_id.speed = 1 + random(1);
                    }
                }
            }
            if (energie == 2)
                my_id.sprite_index = sprBoss2GetUp2;
        }
        else {
            my_id = instance_create(x + lengthdir_x(14, image_angle + 135), y + lengthdir_y(14, image_angle + 135), objBoss2Crawl);
            my_id.image_angle = image_angle;
            my_id2 = instance_create(x, y, objMCHelmet);
            my_id2.sprite_index = sprHelmetBroken;
            if (objPlayer.left)
                my_id2.direction = image_angle + 70 + random(40);
            else my_id2.direction = image_angle - 70 - random(40);
            my_id2.speed = 2 + random(1);

            my_id2 = instance_create(x, y, objMCHelmet);
            my_id2.sprite_index = sprCleaverDrop;
            my_id2.direction = image_angle - 70 + random(40);
            my_id2.speed = 1 + random(0.5);
        }
        with (my_id) {
            pdir = point_direction(objPlayer.x, objPlayer.y, x, y);
            repeat(4) {
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
            repeat(3) {
                my_id = instance_create(x - 3 + random(6) + lengthdir_x(16, pdir), y - 3 + random(6) + lengthdir_y(16, pdir), objBloodSmoke);
                my_id.image_xscale = 1.2 - random(0.2);
                my_id.image_yscale = my_id.image_xscale;
                my_id.image_angle = pdir - 20 + random(40);
                my_id.direction = my_id.image_angle;
                my_id.speed = 2 + random(1);
                my_id.friction = 0.15;
            }
        }
        instance_destroy();
    }
}

