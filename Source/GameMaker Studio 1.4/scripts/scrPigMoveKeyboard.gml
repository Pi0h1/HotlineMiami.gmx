if (global.xbox) {
    scrXboxPlayerMove();
} else {
if instance_exists(objMaskMenu) or instance_exists(objPhoneConversation) {
    // Do nothing.
} else {
    global.test = 0;
    with (objElevator) {
        if (touch) {
        global.test = 1;
        }
    } 
    
    if (persistent && global.test) {
        // Do nothing.
    } else {    
        
        k_le = keyboard_check_direct(ord(global.leftkey));
        k_ri = keyboard_check_direct(ord(global.rightkey));
        
        k_up = keyboard_check_direct(ord(global.upkey));
        k_do = keyboard_check_direct(ord(global.downkey));
        
        myspeed = 3;
        factor  = 1;
        
        isOnStair = place_meeting(x,y,objShadowH) or place_meeting(x,y,objShadowV)
        
        if (isOnStair) {
            myspeed = 2.25;
            factor = 1.35;
        }
        
        if (k_le) {
            if (myxspeed>-(myspeed)) {
                myxspeed -= 0.5;
            } else {
                myxspeed=-(myspeed);
            }
        }
        
        if (k_ri) {
            if (myxspeed<(myspeed)) {
                myxspeed+=0.5;
            } else {
                myxspeed=(myspeed);
            }
        }
        
        if (k_up) {
            if (myyspeed>-(myspeed)) {
                myyspeed-=0.5
            } else {
                myyspeed=-(myspeed);
            }
        }
        
        if (k_do) {
            if (myyspeed<(myspeed)) {
                myyspeed+=0.5;
            } else {
                myyspeed=(myspeed);
            }
        }
        
        if (!k_ri && !k_le) {
            if (myxspeed>0) {
                myxspeed-=0.5;
            } else {
                if (myxspeed<-0.5) {
                    myxspeed+=0.5;
                } else {
                    myxspeed = 0;
                }
            }
        }
        
        if (!k_up && !k_do) {
            if (myyspeed>0) {
                myyspeed-=0.5
            } else {
                if (myyspeed<-0.5) {
                    myyspeed += 0.5;
                } else {
                    myyspeed = 0;
                }
            }
        }
        
        scrMoveSolidOn();
        
        while (abs(myxspeed)+abs(myyspeed))>myspeed+2 {
            myxspeed *= 0.98;
            myyspeed *= 0.98;
        }
        
        if (abs(myxspeed) == 0 && abs(myyspeed) == 0) {
            legindex = 0;
        } else {
            legindex+=(abs(myxspeed)+abs(myyspeed))*0.1*factor
            if scrPigIsWalking(sprite_index) image_index+=(abs(myxspeed)+abs(myyspeed))*0.05
        }
        
        legdir = point_direction(0, 0, myxspeed, myyspeed);
        
        if (abs(myxspeed) > 0) {
            if place_free(x + myxspeed, y) {
                x += myxspeed;
            } else {
                if (myyspeed == 0) {
                    if place_free(x + myxspeed, y - 8) {
                        y -= myspeed;
                    } else {
                        if place_free(x + myxspeed, y + 8) {
                            y += myspeed;
                        } else {
                            move_contact_solid(90 - sign(myxspeed) * 90, abs(myxspeed)); 
                            myxspeed = 0;
                        }
                    }
                }
            }
        }
        
        if (abs(myyspeed) > 0) {
            if place_free(x, y + myyspeed) {
                y += myyspeed;
            } else {
                if (myxspeed == 0) {
                    if place_free(x-8,y+myyspeed) {
                        x-=myspeed;
                    } else {
                        if place_free(x+8,y+myyspeed) {
                            x += myspeed;
                        } else {
                            move_contact_solid( - sign(myyspeed) * 90, abs(myyspeed));
                            myyspeed = 0;
                        }
                    }
                }
            }
        }
        var m = 64; // margin
        x = clamp(x,-m,room_width+m);
        y = clamp(y,-m,room_height+m);
        scrMoveSolidOff();
        }
    }
}
