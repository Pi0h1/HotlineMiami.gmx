mask_index = sprElevatorFloor;
touch = 0;
if (!place_meeting(x, y, objPlayer)) {
    if (wait < 30)
        wait = 30;
}
if (instance_number(objPlayerMouse) + instance_number(objPlayerMouseHouse) + instance_number(objPlayerBiker) + instance_number(objPlayerBikerHouse) == 0)
    exit;
if (!valid)
    exit;
if (instance_exists(objEnemy) || instance_exists(objBoss)) {
    if (place_meeting(x, y, objPlayer)) {
        if (wait > 0)
            wait--;
        else {
            if (index < 6)
                index += 0.5;
        }
    }
    if (index < 3)
        mask_index = sprite_index;
    else mask_index = sprElevatorMask;
    image_index = index;

}
if (room == rmHotelEntrance) {
    test = 1;
    if (objFatmanEating.sprite_index == sprFatmanEating || objFatmanEating.sprite_index == sprFatmanEatingGiveUp || objFatmanTelephone.sprite_index == sprFatmanTelephone || objFatmanTelephone.sprite_index == sprFatmanTelephoneGiveUp)
        test = 0;
    if (test == 0)
        exit;
}

if (room == rmHotelSuite) {
    test = 1;
    if (objFatmanShit.sprite_index == sprFatmanShit || objFatmanShit.sprite_index == sprFatmanShitGiveUp)
        test = 0;
    if (test == 0)
        exit;
}

if (instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objBoss) + instance_number(objFiles) + instance_number(objMiscEnemy) + instance_number(objBossgun) == 0) {
    if (!global.done) {
        if (place_meeting(x, y, objPlayer)) {
            touch = 1;
            objPlayer.addx = 0;
            objPlayer.addy = 0;
            if (objPlayer.x < x - 2)
                objPlayer.x += 2;
            if (objPlayer.x > x + 2)
                objPlayer.x -= 2;
            if (objPlayer.y < y - 2)
                objPlayer.y += 2;
            if (objPlayer.y > y + 2)
                objPlayer.y -= 2;
            if (objPlayer.x < x + 2 && objPlayer.x > x - 2 && objPlayer.y > y - 2 && objPlayer.y < y + 2) {
                // do nothing
            } else {
                objPlayer.image_index += 0.15;
                objPlayer.legindex += 0.4;
            }
            objPlayer.persistent = 1;
            if (image_angle == 0) {
                if (objPlayer.y > y)
                    objPlayer.addy = 0;
            }
            if (image_angle == 90) {
                if (objPlayer.x > x)
                    objPlayer.addx = 0;
            }
            if (image_angle == 180) {
                if (objPlayer.y < y)
                    objPlayer.addy = 0;
            }
            if (image_angle == 270) {
                if (objPlayer.x < x)
                    objPlayer.addx = 0;
            }

            if (wait > 0)
                wait--;
            else {
                if (index > 0)
                    index -= 0.5;
                if (!objEffector.fade) {
                    objPlayer.movex = movex;
                    objPlayer.movey = movey;
                    if (abs(movex) > 0 || abs(movey) > 0)
                        objPlayer.move = 1;
                    objEffector.next = 1;
                    objEffector.fade = 1;
                    objEffector.nextroom = nextroom;

                }
            }

        } else {
            if (index < 6)
                index += 0.2;
        }
    } else {
        if (place_meeting(x, y, objPlayer)) {
            if (instance_exists(objPlayerCarEnter) || instance_exists(objMCBike)) {
                if (wait > 0) {
                    index = 0;
                    wait--;
                } else {
                    if (index < 6)
                        index += 0.5;
                }
            } else {
                touch = 1;
                objPlayer.addx = 0;
                objPlayer.addy = 0;
                if (objPlayer.x < x - 2)
                    objPlayer.x += 2;
                if (objPlayer.x > x + 2) objPlayer.x -= 2;
                if (objPlayer.y < y - 2) objPlayer.y += 2;
                if (objPlayer.y > y + 2) objPlayer.y -= 2;
                if (objPlayer.x < x + 2 && objPlayer.x > x - 2 && objPlayer.y > y - 2 && objPlayer.y < y + 2) {
                    // do nothing
                } else {
                    objPlayer.image_index += 0.15;
                    objPlayer.legindex += 0.15;
                }
                objPlayer.persistent = 1;
                if (image_angle == 0) {
                    if (objPlayer.y > y)
                        objPlayer.addy = 0;
                }
                if (image_angle == 90) {
                    if (objPlayer.x > x)
                        objPlayer.addx = 0;
                }
                if (image_angle == 180) {
                    if (objPlayer.y < y)
                        objPlayer.addy = 0;
                }
                if (image_angle == 270) {
                    if (objPlayer.x < x)
                        objPlayer.addx = 0;
                }

                if (wait > 0)
                    wait--;
                else {
                    if (index > 0)
                        index -= 0.5;
                    if (!objEffector.fade) {
                        objPlayer.movex = movex;
                        objPlayer.movey = movey;
                        if (abs(movex) > 0 || abs(movey) > 0)
                            objPlayer.move = 1;
                        objEffector.next = 1;
                        objEffector.fade = 1;
                        objEffector.nextroom = nextroom;
                        objPlayer.persistent = 1;
                    }
                }
            }
        }
    }
}
if (index < 3)
    mask_index = sprite_index;
else mask_index = sprElevatorMask;
image_index = index;

valid = 1;

