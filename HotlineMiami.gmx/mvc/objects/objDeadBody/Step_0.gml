scrMoveSolidOn();
if (!place_free(x, y))
    speed = 0;
scrMoveSolidOff();
if (sprite_index == sprEBackThroat) {
    if (bled == 0) {
        instance_create(x + lengthdir_x(19, dir), y + lengthdir_y(19, dir), objBloodPool);
        bled = 1;
    } else {
        if (round(random(25)) == 2 && life > 0) {
            dir = image_angle + image_yscale * 12;
            my_id = instance_create(x + lengthdir_x(19, dir), y + lengthdir_y(19, dir), objBloodSquirt);
            my_id.image_angle = random(360);
        }
        if (life > 0)
            life--;
        else {
            image_speed = 0;
            if (!place_meeting(x, y, objBloodPool)) {
                if (surface_exists(global.surf2) && global.surfaces)
                    addToSurface(global.surf2, 1);
            }
        }
    }
    exit;
}

if (sprite_index == sprEBackScissor) {
    image_speed = 0;
    if (life > 0) {
        life--;
        if (image_index < 7.3)
            image_index += 0.15;
        else image_index = 0;
    } else {
        if (image_index < 13)
            image_index += 0.15;
        else {
            if (surface_exists(global.surf2) && !place_meeting(x, y, objBloodPool) && global.surfaces)
                addToSurface(global.surf2, 1);
        }
    }
    exit;
}

if (sprite_index == sprEBackHeadJerk) {
    image_speed = 0;
    if (life > 0) {
        life -= 2;
    } else {
        if (image_index < 6)
            image_index += 0.15;
        else {
            if (surface_exists(global.surf2) && !place_meeting(x, y, objBloodPool) && global.surfaces)
                addToSurface(global.surf2, 1);
        }
        if (round(random(12)) == 2) {
            my_id = instance_create(x + lengthdir_x(21, image_angle), y + lengthdir_y(21, image_angle), objBloodSquirt);
            my_id.image_angle = image_angle - 30 + random(60);
        }
    }
    exit;
}

if (sprite_index == sprEBackCracked) {
    image_speed = 0;
    if (life > 0) {
        life--;
        if (image_index < 3.3)
            image_index += 0.15;
        else image_index = 0;
        if (round(random(30)) == 2) {
            my_id = instance_create(x + lengthdir_x(22, image_angle), y + lengthdir_y(22, image_angle), objBloodSquirt);
            my_id.image_angle = image_angle - 20 + random(40);
        }
    } else {
        if (image_index < 9)
            image_index += 0.15;
        else {
            if (surface_exists(global.surf2) && !place_meeting(x, y, objBloodPool) && global.surfaces)
                addToSurface(global.surf2, 1);
        }
    }
    exit;
}

if (sprite_index == sprEBackShotgunVomit) {
    image_speed = 0;
    if (image_index < 26)
        image_index += 0.15;
    else {
        if (surface_exists(global.surf2) && !place_meeting(x, y, objBloodPool) && global.surfaces)
            addToSurface(global.surf2, 1);
    }
    if (bled == 0 && image_index >= 19) {
        dir = image_angle - image_yscale;
        instance_create(x + lengthdir_x(7, dir), y + lengthdir_y(7, dir), objBloodPool);
        bled = 1;
        repeat(5) {
            my_id = instance_create(x + lengthdir_x(7, dir - 15), y + lengthdir_y(7, dir - 15), objBloodSquirt);
            my_id.image_angle = image_angle + 90 * image_yscale - 40 + random(80);
        }
    }
    exit;
}

if (sprite_index == sprEBackHeadshot) {
    image_speed = 0;
    if (image_index < 19)
        image_index += 0.2;
    else {
        if (surface_exists(global.surf2) && !place_meeting(x, y, objBloodPool) && global.surfaces)
            addToSurface(global.surf2, 1);
    }
    if (bled == 0 && image_index >= 13) {
        dir = image_angle;
        instance_create(x + lengthdir_x(40, dir), y + lengthdir_y(40, dir), objBloodPool);
        bled = 1;
        repeat(5) {
            my_id = instance_create(x + lengthdir_x(45, dir), y + lengthdir_y(45, dir), objBloodSquirt);
            my_id.image_angle = image_angle - 40 + random(80);
        }
    }
    exit;
}

if (sprite_index == sprEDeadDart) {
    image_speed = 0;
    if (life > 0) {
        life--;
        if (image_index < 7.3)
            image_index += 0.15;
        else image_index = 0;
    } else {
        if (image_index < 13)
            image_index += 0.15;
        else {
            if (surface_exists(global.surf2) && !place_meeting(x, y, objBloodPool) && global.surfaces)
                addToSurface(global.surf2, 1);
        }
    }
    exit;
}

if (sprite_index == sprEDeadBoiling) {
    image_speed = 0;
    if (life > 0) {
        life--;
        if (life > 60 && round(random(3)) == 2)
            instance_create(x + lengthdir_x(21, image_angle), y + lengthdir_y(21, image_angle), objSteam);
        if (image_index < 7.3)
            image_index += 0.15;
        else image_index = 0;
    } else {
        if (image_index < 13)
            image_index += 0.15;
    }
    exit;
}

if (speed == 0 && bled = 0) {
    bled = 1;
    length = random(24);
    if (sprite_index == sprEBackBlunt || sprite_index == sprEFrontBlunt || sprite_index == sprPoliceBackBlunt || sprite_index == sprPoliceFrontBlunt)
        repeat(1 + random(2)) instance_create(x + lengthdir_x(24, image_angle) - 2 + random(4), y + lengthdir_y(24, image_angle) - 2 + random(4), objBloodPool);
    if (sprite_index == sprEBackCut)
        repeat(1 + random(2)) instance_create(x + lengthdir_x(6, image_angle) - 2 + random(4), y + lengthdir_y(6, image_angle) - 2 + random(4), objBloodPool);
    if (sprite_index == sprEBackShotgun || sprite_index == sprPoliceBackShotgun || sprite_index == sprEFrontShotgun || sprite_index == sprPoliceFrontShotgun)
        repeat(2 + random(2)) instance_create(x + lengthdir_x(length, image_angle) - 2 + random(4), y + lengthdir_y(length, image_angle) - 2 + random(4), objBloodPool);
    if (sprite_index == sprEBackMachinegun || sprite_index == sprWaiterDeadShotgun || sprite_index == sprWaiterDeadMachinegun || sprite_index == sprPoliceBackMachinegun || sprite_index == sprEFrontMachinegun || sprite_index == sprPoliceFrontMachinegun)
        repeat(2 + random(2)) instance_create(x + lengthdir_x(length, image_angle) - 2 + random(4), y + lengthdir_y(length, image_angle) - 2 + random(4), objBloodPool);
    if (sprite_index == sprDogDeadCut || sprite_index == sprDogDeadShot || sprite_index == sprDogDeadBlunt)
        repeat(1 + random(2)) instance_create(x + lengthdir_x(2, image_angle) - 2 + random(4), y + lengthdir_y(2, image_angle), objBloodPool);

    if (sprite_index == sprEBackKicked) {
        repeat(2 + random(3)) {
            dir = image_angle;
            my_id = instance_create(x, y, objBloodSquirt);
            my_id.image_angle = random(360);
        }
    }



    if (sprite_index == sprEBackBashed) {
        repeat(2 + random(3)) {
            dir = image_angle - 2 + random(4);
            my_id = instance_create(x + lengthdir_x(24, dir), y + lengthdir_y(24, dir), objBloodSquirt);
            my_id.image_angle = dir - 100 + random(200);
        }
    }


    if (sprite_index == sprEBackSlashed) {
        if (image_index == 0) {
            repeat(2 + random(3)) {
                dir = image_angle - 2 + random(4);
                my_id = instance_create(x + lengthdir_x(20, dir), y + lengthdir_y(20, dir), objBloodSquirt);
                my_id.image_angle = dir - 30 + random(60);
            }
        }

        if (image_index == 1) {
            repeat(2 + random(3)) {
                dir = image_angle - 26 + random(52);
                my_id = instance_create(x + lengthdir_x(6, dir), y + lengthdir_y(6, dir), objBloodSquirt);
                my_id.image_angle = dir - 30 + random(60);
            }
        }

        if (image_index == 1) {
            repeat(2 + random(3)) {
                dir = image_angle - 16 + random(32);
                my_id = instance_create(x + lengthdir_x(16, dir), y + lengthdir_y(16, dir), objBloodSquirt);
                my_id.image_angle = dir - 30 + random(60);
            }
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

    if (sprite_index == sprDogDeadShot) {
        if (image_index == 3) {
            repeat(2 + random(3)) {
                dir = image_angle - 2 + random(4);
                my_id = instance_create(x + lengthdir_x(8, dir), y + lengthdir_y(8, dir), objBloodSquirt);
                my_id.image_angle = dir - 30 + random(60);
            }
        }
    }


    if (sprite_index == sprEBackShotgun) {
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
if (wait > 0)
    wait--;
else {
    if (bled == 1) {
        if (!place_meeting(x, y, objBloodPool)) {
            if (surface_exists(global.surf2) & global.surfaces)
                addToSurface(global.surf2, 1);
        }
    }
}

