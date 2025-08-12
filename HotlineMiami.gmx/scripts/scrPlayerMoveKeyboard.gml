//Initialize Xbox Controls.
if (global.xbox)
    scrXboxPlayerMove()
else {

    if (instance_exists(objMaskMenu) or instance_exists(objPhoneConversation)) {
        // do nothing
    } else {
        global.test = 0;
        with (objElevator)
            if (touch)
                global.test = 1;
        if (persistent && global.test == 1) {
            // do nothing
        } else {

            //Default Speed = 3.
            myspeed = 3;

            //Speed multiplier by wich player moves.
            factor = 1;

            //Biker's speed.
            if (object_index == objPlayerBiker) {
                myspeed = 3.5;
                factor = 1;
            }

            //Graham's speed (Walk Fast).
            if (global.maskindex == 5 && global.maskon) {
                myspeed = 3.5;
                factor = 1;
            }

            //Brandon's speed (Walk Faster).
            if (global.maskindex == 16 && global.maskon) {
                myspeed = 4;
                factor = 1;
            }

            //Up-Down Stairs movement. Not important.
            if (place_meeting(x, y, objShadowH) || place_meeting(x, y, objShadowV)) {
                myspeed = 2.25;
                factor = 1.35;
            }

            //Carrying Hooker speed = Half of defaut speed.
            if (sprite_index == sprPWalkGirlfriend)
                myspeed = 1.5;

            //Trauma Movement's Speed.
            if (sprite_index == sprPWalkHospital)
                myspeed = 2;
            if (object_index = objPlayerHospital) {
                factor = 2;
                myspeed = 1.5;
            }

            //Nigel (Reversed Controls).
            if (global.maskindex == 20) {
                if (keyboard_check_direct(ord(global.rightkey))) {
                    if (myxspeed > -(myspeed))
                        myxspeed -= 0.5;
                    else myxspeed = -(myspeed);
                }

                if (keyboard_check_direct(ord(global.leftkey))) {
                    if (myxspeed < (myspeed))
                        myxspeed += 0.5;
                    else myxspeed = (myspeed);
                }

                if (keyboard_check_direct(ord(global.downkey))) {
                    if (myyspeed > -(myspeed))
                        myyspeed -= 0.5;
                    else myyspeed = -(myspeed);
                }

                if (keyboard_check_direct(ord(global.upkey))) {
                    if (myyspeed < (myspeed))
                        myyspeed += 0.5;
                    else myyspeed = (myspeed);
                }
            } else {

                //Default Controls.
                if (keyboard_check_direct(ord(global.leftkey))) {
                    if (myxspeed > -(myspeed))
                        myxspeed -= 0.5;
                    else myxspeed = -(myspeed);
                }

                if (keyboard_check_direct(ord(global.rightkey))) {
                    if (myxspeed < (myspeed))
                        myxspeed += 0.5;
                    else myxspeed = (myspeed);
                }

                if (keyboard_check_direct(ord(global.upkey))) {
                    if (myyspeed > -(myspeed))
                        myyspeed -= 0.5;
                    else myyspeed = -(myspeed);
                }

                if (keyboard_check_direct(ord(global.downkey))) {
                    if (myyspeed < (myspeed))
                        myyspeed += 0.5;
                    else myyspeed = (myspeed);
                }

            }


            //Adresses conflicts in directions.
            if (!keyboard_check_direct(ord(global.rightkey)) && !keyboard_check_direct(ord(global.leftkey))) {
                if (myxspeed > 0)
                    myxspeed -= 0.5;
                else {
                    if (myxspeed < -0.5)
                        myxspeed += 0.5;
                    else myxspeed = 0;
                }
            }

            if (!keyboard_check_direct(ord(global.upkey)) && !keyboard_check_direct(ord(global.downkey))) {
                if (myyspeed > 0)
                    myyspeed -= 0.5;
                else {
                    if (myyspeed < -0.5)
                        myyspeed += 0.5;
                    else myyspeed = 0;
                }
            }



            scrMoveSolidOn();
            while ((abs(myxspeed) + abs(myyspeed)) > myspeed + 2) {
                myxspeed *= 0.98;
                myyspeed *= 0.98;
            }

            //Leg index.
            if (abs(myxspeed) == 0 && abs(myyspeed) == 0)
                legindex = 0;
            else {
                legindex += (abs(myxspeed) + abs(myyspeed)) * 0.1 * factor;

                //Trauma's dizziness effect.
                with (objDizzy) {
                    if (dizziness < 1)
                        dizziness += 0.01;
                }

                //Is the player moving? if yes, increase the image_index of the legs' sprites.
                if (scrIsWalking(sprite_index))
                    image_index += (abs(myxspeed) + abs(myyspeed)) * 0.05;
            }
            legdir = point_direction(0, 0, myxspeed, myyspeed);
            if (abs(myxspeed) > 0) {
                if (place_free(x + myxspeed, y))
                    x += myxspeed;
                else {
                    if (myyspeed == 0) {
                        if (place_free(x + myxspeed, y - 8))
                            y -= myspeed;
                        else {
                            if (place_free(x + myxspeed, y + 8))
                                y += myspeed;
                            else {
                                move_contact_solid(90 - sign(myxspeed) * 90, abs(myxspeed));
                                myxspeed = 0;
                            }
                        }
                    }
                }
            }
            if (abs(myyspeed) > 0) {
                if (place_free(x, y + myyspeed))
                    y += myyspeed;
                else {
                    if (myxspeed == 0) {
                        if (place_free(x - 8, y + myyspeed))
                            x -= myspeed;
                        else {
                            if (place_free(x + 8, y + myyspeed))
                                x += myspeed;
                            else {
                                move_contact_solid(-sign(myyspeed) * 90, abs(myyspeed));
                                myyspeed = 0;
                            }
                        }
                    }
                }
            }
            if (x < -64)
                x = -64;
            if (x > room_width + 64)
                x = room_width + 64;
            if (y < -64)
                y = -64;
            if (y > room_height + 64)
                y = room_height + 64;
            scrMoveSolidOff();
        }

    }
}
