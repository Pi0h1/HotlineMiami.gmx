/// scrPlayerMove(player speed, factor, moveScale)
var deltaTime = (delta_time / 1000000) * 60;
var allowMovement = true;
var levelLimits = 64;
var acceleration = (0.5)*deltaTime;
var moveScale = argument2

if instance_exists(objMaskMenu)             allowMovement = false; else allowMovement=true;
if instance_exists(objPhoneConversation)    allowMovement = false; else allowMovement=true;

global.test = 0
with objElevator
if touch = 1 global.test = 1
if persistent = 1 and global.test = 1 nothing = 1
else {
    myspeed = (argument0)*deltaTime;
    factor = (argument1)*deltaTime;
    magicNumber = (0.98)*deltaTime;

    moveleft    = keyboard_check_direct(ord(global.leftkey))    || keyboard_check_direct(vk_left)
    moveright   = keyboard_check_direct(ord(global.rightkey))   || keyboard_check_direct(vk_right)
    moveup      = keyboard_check_direct(ord(global.upkey))      || keyboard_check_direct(vk_up)
    movedown    = keyboard_check_direct(ord(global.downkey))    || keyboard_check_direct(vk_down)
    
    if allowMovement{
        if moveleft{
            if myxspeed > -(myspeed) myxspeed -= (acceleration) * moveScale
            else myxspeed = (-(myspeed)) * moveScale
        }
        if moveright {
            if myxspeed < (myspeed) myxspeed += (acceleration) * moveScale
            else myxspeed = (myspeed) * moveScale
        }
        if moveup {
            if myyspeed > -(myspeed) myyspeed -= (acceleration) * moveScale
            else myyspeed = (-(myspeed)) * moveScale
        }
        if movedown {
            if myyspeed < (myspeed) myyspeed += (acceleration) * moveScale
            else myyspeed = (myspeed) * moveScale
        }
    
        //Adresses conflicts in directions.
        if (!moveright and!moveleft) {
            if myxspeed > 0 myxspeed -= acceleration
            else {
                if myxspeed < -acceleration myxspeed += acceleration
                else myxspeed = 0
            }
        }
    
        if (!moveup and!movedown) {
            if myyspeed > 0 myyspeed -= acceleration
            else {
                if myyspeed < -acceleration myyspeed += acceleration
                else myyspeed = 0
            }
        }
    
        scrMoveSolidOn()
        while (abs(myxspeed) + abs(myyspeed)) > myspeed + 2 {
            myxspeed *= magicNumber
            myyspeed *= magicNumber
        }
        
        if abs(myxspeed) = 0 and abs(myyspeed) = 0 legindex = 0
        else {
            legindex += (abs(myxspeed) + abs(myyspeed)) * 0.1 * factor // Leg index.
            with objDizzy {
                if dizziness < 1 dizziness += 0.01
            } // Trauma's dizziness effect.
            if scrIsWalking(sprite_index) image_index += (abs(myxspeed) + abs(myyspeed)) * 0.05 // Animate the player sprite if the player is walking.
        }
    
        legdir = point_direction(0, 0, myxspeed, myyspeed)
        if abs(myxspeed) > 0 {
            if place_free(x + myxspeed, y) x += myxspeed
            else {
                if myyspeed = 0 {
                    if place_free(x + myxspeed, y - 8) y -= myspeed
                    else {
                        if place_free(x + myxspeed, y + 8) y += myspeed
                        else {
                            move_contact_solid(90 - sign(myxspeed) * 90, abs(myxspeed))
                            myxspeed = 0
                        }
                    }
                }
            }
        }
        if abs(myyspeed) > 0 {
            if place_free(x, y + myyspeed) y += myyspeed
            else {
                if myxspeed = 0 {
                    if place_free(x - 8, y + myyspeed) x -= myspeed
                    else {
                        if place_free(x + 8, y + myyspeed) x += myspeed
                        else {
                            move_contact_solid(-sign(myyspeed) * 90, abs(myyspeed))
                            myyspeed = 0
                        }
                    }
                }
            }
        }
    }
    if x < -levelLimits x = -levelLimits
    if x > room_width + levelLimits x = room_width + levelLimits
    if y < -levelLimits y = -levelLimits
    if y > room_height + levelLimits y = room_height + levelLimits
    scrMoveSolidOff()
}
