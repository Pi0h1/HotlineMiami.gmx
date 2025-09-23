scrMoveSolidOn();
with (objDoorV) {
    test = solid;
    solid = 1;
}
if (!place_free(x + hspeed * 4, y))
    hspeed = -hspeed;
if (!place_free(x, y + vspeed))
    vspeed = -vspeed;
with (objDoorV) {
    solid = test;
}
scrMoveSolidOff();
if (!instance_exists(objPlayer))
    exit;
if (sprite_index == sprWaiterWalkUzi) {
    speed = 0;
    image_speed = 0;
    check = scrLook(objPlayer.x, objPlayer.y, 4);
    if (check == 0 || check == 2) {
        direction = scrRotate(direction, point_direction(x, y, objPlayer.x, objPlayer.y), 10);
        if (reload > 0)
            reload--;
        else {
            if (ammo > 0) {
                ammo--;
                my_id = instance_create(x + lengthdir_x(24, direction), y + lengthdir_y(24, direction), objEBullet);
                my_id.direction = direction - 5 + random(10);
                my_id.speed = 12;
                my_id.image_angle = my_id.direction;
                reload = 2;
                with (objEffector)
                    uzisnd = 1;
            }
        }
    }
    exit;
}



if (checkreload > 0)
    checkreload--;
else {
    checkreload = 30;
    check = scrLook(objPlayer.x, objPlayer.y, 4);
    if (check == 0 || check == 2) {
        if (sprite_index == sprWaiterWalkWine) {
            sprite_index = sprWaiterWalkUzi;
            my_id = instance_create(x + lengthdir_x(7, direction - 65), y + lengthdir_y(7, direction - 65), objWineBottle);
            my_id.direction = direction - 65;
            my_id.speed = 2;
            my_id.friction = 0.1;
            my_id.image_angle = image_angle;
            audio_play_sound(sndPickupWeapon, 0, false);
        }

        if (sprite_index == sprWaiterWalkFood) {
            sprite_index = sprWaiterWalkUzi;
            my_id = instance_create(x + lengthdir_x(7, direction - 65), y + lengthdir_y(7, direction - 65), objFoodTray);
            my_id.direction = direction - 65;
            my_id.speed = 2;
            my_id.friction = 0.1;
            my_id.image_angle = image_angle;
            audio_play_sound(sndPickupWeapon, 0, false);
        }
    }
}

