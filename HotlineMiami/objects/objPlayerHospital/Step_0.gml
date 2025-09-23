global.test = 0;
__view_set( e__VW.XView, 0, xview );
__view_set( e__VW.YView, 0, yview );
if (sprite_index == sprPKeyLockOpen) {
    if (image_index < 4){
        image_index += 0.2;
    } else {
        active = 1;
        with (objLockedDoor)
            image_index = 1;
        sprite_index = sprPWalkHospital;
    }
    exit
}
with (objWeapon) {
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 32)
        global.test = 2;
}
if (place_meeting(x, y, objKnockedOut))
    global.test = 1;
objEffector.action = global.test;
if (throwreload > 0)
    throwreload--;
if (instance_exists(objPhoneConversation)) {
    valid = 0;
} else valid = 1;
factor = 1;
if (global.xbox == 0) {
    aimfar = keyboard_check_direct(vk_shift);
} else aimfar = checkbutton(0, getid(9));
if (aimfar && valid) {
    if (global.xbox) {
        viewx = objPlayer.x + rightthumb_x(0) * 0.0045;
        viewy = objPlayer.y - rightthumb_y(0) * 0.003;
    } else {
        factor = 1.8;
        viewx = objPlayer.x + ((display_mouse_get_x() - display_get_width() * 0.5) * (__view_get( e__VW.WView, 0 ) / display_get_width())) * factor;
        viewy = objPlayer.y + ((display_mouse_get_y() - display_get_height() * 0.5) * (__view_get( e__VW.HView, 0 ) / display_get_height())) * factor;
    }
    viewspeed = point_distance(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, viewx, viewy) * 0.1;
    viewdir = point_direction(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, viewx, viewy);
    __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (lengthdir_x(viewspeed, viewdir)) );
    __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (lengthdir_y(viewspeed, viewdir)) );
    vdist = point_distance(x, y, room_width / 2, room_height / 2);
    vdir = point_direction(room_width / 2, room_height / 2, x, y);
    __view_set( e__VW.Angle, 0, lengthdir_y(objDizzy.dizziness * 20, lengthdir_x(objDizzy.dizziness * 30, global.dir * 3)) );
} else {
    if (objPlayer.active == 0 && instance_exists(objPhoneConversation)) {
        with (global.doctor) {
            valid = 0;
            vdist = point_distance(x, y, room_width / 2 - (1 - valid) * 88, room_height / 2);
            vdir = point_direction(room_width / 2 - (1 - valid) * 88, room_height / 2, x, y);
            viewspeed = point_distance(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2 - (1 - valid) * 88, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
            viewdir = point_direction(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2 - (1 - valid) * 88, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
            __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (lengthdir_x(viewspeed, viewdir)) );
            __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (lengthdir_y(viewspeed, viewdir)) );
            __view_set( e__VW.Angle, 0, lengthdir_y(objDizzy.dizziness * 20, lengthdir_x(objDizzy.dizziness * 30, global.dir * 3)) );
        }
    } else {
        viewspeed = point_distance(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, x + lengthdir_x(24, dir), y + lengthdir_y(24, dir)) * 0.1;
        viewdir = point_direction(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, x + lengthdir_x(24, dir), y + lengthdir_y(24, dir));
        __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (lengthdir_x(viewspeed, viewdir)) );
        __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (lengthdir_y(viewspeed, viewdir)) );
        __view_set( e__VW.Angle, 0, lengthdir_y(objDizzy.dizziness * 20, lengthdir_x(objDizzy.dizziness * 30, global.dir * 3)) );
    }
}
if (sprite_index == sprPHospitalHeadache) {
    if (global.shake < 6)
        global.shake += 0.25;
    with (objDizzy) {
        if (dizziness > 0.1)
            dizziness -= 0.005;
    }
} else {
    if (global.shake > 0)
        global.shake -= 0.5;
}
xview = __view_get( e__VW.XView, 0 );
yview = __view_get( e__VW.YView, 0 );
__view_set( e__VW.XView, 0, xview - global.shake + global.shake * 2 );
__view_set( e__VW.YView, 0, yview - global.shake + global.shake * 2 );

if (persistent && objEffector.fade) {
    if (place_free(x + addx, y))
        x += addx;
    if (place_free(x, y + addy))
        y += addy;
    if (image_speed == 0)
        image_index += 0.15;
    legindex += 0.4;
    exit;
}

if (active) {
    scrPlayerHospitalMove();
    if (global.xbox)
        scrXboxPlayerHospitalMouse();
}

