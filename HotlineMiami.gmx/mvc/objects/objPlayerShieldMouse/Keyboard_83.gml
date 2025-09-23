if (energie < 9) {
    // do nothing
} else {
    if (persistent && objEffector.fade) {
        nothing = 1
    } else {
        if (sprite_index == sprShieldSnapUzi or sprite_index == sprShieldSnapMP5 or sprite_index == sprShieldSnapDoubleBarrel or sprite_index == sprShieldSnapSilencer or sprite_index == sprShieldSnapScorpion or sprite_index == sprShieldSnapMagnum) {
            // do nothing
        } else {
            if (instance_exists(objMaskMenu)) {
                // do nothing
            } else {
                scrMoveSolidOn();
                if (place_free(x, y + 2)) {
                    y += 2;
                } else {
                    if (place_free(x - 8, y + 2)) {
                        x -= 2
                    } else {
                        if (place_free(x + 8, y + 2)) {
                            x += 2;
                        }
                    }
                }
                if (image_speed == 0)
                    image_index += 0.1;
                legindex += 0.25;
                legindex2 += 0.25;
                legdir = 270;
                if (keyboard_check(ord("A")))
                    legdir = 225;
                if (keyboard_check(ord("D")))
                    legdir = 315;

                scrMoveSolidOff();
            }
        }
    }
}

