scrMoveSolidOn();
if (!place_free(x, y))
    speed = 0;
scrMoveSolidOff();

if (speed == 0 && bled == 0) {
    bled = 1;
    length = random(24);

    if (sprite_index = sprEBackBlunt)
    repeat(1 + random(2))
        instance_create(x + lengthdir_x(24, image_angle) - 2 + random(4), y + lengthdir_y(24, image_angle) - 2 + random(4), objBloodPool);

    if (sprite_index == sprEBackCut)
    repeat(1 + random(2))
        instance_create(x + lengthdir_x(6, image_angle) - 2 + random(4), y + lengthdir_y(6, image_angle) - 2 + random(4), objBloodPool);

    if (sprite_index == sprPBackShotgun || sprite_index == sprPBackCar)
        repeat(2 + random(2))
            instance_create(x + lengthdir_x(length, image_angle) - 2 + random(4), y + lengthdir_y(length, image_angle) - 2 + random(4), objBloodPool);
            
    if (sprite_index == sprPBackMachinegun)
        repeat(2 + random(2))
            instance_create(x + lengthdir_x(length, image_angle) - 2 + random(4), y + lengthdir_y(length, image_angle) - 2 + random(4), objBloodPool);

    if sprite_index = sprPBackEaten {
        repeat(2 + random(3)) {
            dir = image_angle + image_yscale * 12;
            my_id = instance_create(x + lengthdir_x(19, dir), y + lengthdir_y(19, dir), objBloodSquirt);
            my_id.image_angle = random(360);
        }
    }

    if (sprite_index == sprEBackBlunt) {
        if (image_index == 6 || image_angle == 13) {
            repeat(2 + random(3)) {
                dir = image_angle - 2 + random(4);
                my_id = instance_create(x + lengthdir_x(24, dir), y + lengthdir_y(24, dir), objBloodSquirt);
                my_id.image_angle = dir - 35 + random(70);
            }
        }

        if (image_index == 14) {
            repeat(2 + random(3)) {
                dir = image_angle + (2 + random(4)) * image_yscale;
                my_id = instance_create(x + lengthdir_x(24, dir), y + lengthdir_y(24, dir), objBloodSquirt);
                my_id.image_angle = dir - random(50);
            }
        }

        if (image_index == 12) {
            repeat(2 + random(3)) {
                dir = image_angle - 2 + random(4);
                my_id = instance_create(x + lengthdir_x(24, dir), y + lengthdir_y(24, dir), objBloodSquirt);
                my_id.image_angle = dir - 70 + random(140);
            }
        }
    }

    if (sprite_index == sprPBackShotgun) {
        if (image_index == 2) {
            repeat(2 + random(3)) {
                dir = image_angle + image_yscale * 12;
                my_id = instance_create(x + lengthdir_x(15, dir), y + lengthdir_y(15, dir), objBloodSquirt);
                my_id.image_angle = image_angle + 90 * image_yscale - 20 + random(60);
            }
        }

        if (image_index == 3) {
            repeat(2 + random(3)) {
                dir = image_angle - 2 + random(4);
                my_id = instance_create(x + lengthdir_x(19, dir), y + lengthdir_y(19, dir), objBloodSquirt);
                my_id.image_angle = dir - 30 + random(60);
            }
        }
    }

    if (sprite_index == sprEBackCut) {
        if (image_index == 2) {
            repeat(2 + random(3)) {
                dir = image_angle + image_yscale * 12;
                my_id = instance_create(x + lengthdir_x(19, dir), y + lengthdir_y(19, dir), objBloodSquirt);
                my_id.image_angle = random(360);
            }
        }
    }

}

if (room == rmSequence12c) {
    // do nothing
} else {
    vdist = point_distance(x, y, room_width / 2, room_height / 2);
    vdir = point_direction(room_width / 2, room_height / 2, x, y);
    viewspeed = point_distance(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
    viewdir = point_direction(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
    __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (lengthdir_x(viewspeed, viewdir)) );
    __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (lengthdir_y(viewspeed, viewdir)) );
    __view_set( e__VW.Angle, 0, lengthdir_y(vdist * (1 / 100), vdir * 2) );
}

