valid = 1;
vdist = point_distance(x, y, room_width / 2 - (1 - valid) * 88, room_height / 2);
vdir = point_direction(room_width / 2 - (1 - valid) * 88, room_height / 2, x, y);
viewspeed = point_distance(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2 - (1 - valid) * 88, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
viewdir = point_direction(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2 - (1 - valid) * 88, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
__view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (lengthdir_x(viewspeed, viewdir)) );
__view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (lengthdir_y(viewspeed, viewdir)) );
if (instance_exists(objDizzy)) {
    __view_set( e__VW.Angle, 0, lengthdir_y(objDizzy.dizziness * 20, lengthdir_x(objDizzy.dizziness * 30, global.dir * 3)) );
} else {
    vdist = point_distance(x, y, room_width / 2, room_height / 2);
    vdir = point_direction(room_width / 2, room_height / 2, x, y);
    __view_set( e__VW.Angle, 0, lengthdir_y(vdist * (1 / 160), vdir * 2) );
}
if (sprite_index == sprPClimbLedge) {
    if (image_index < 10) {
        image_index += 0.2
    } else {
        instance_create(x + 30, y + 34, objPlayerMouse);
        instance_destroy();
    }
}

if (global.xbox) {
    scrXboxPlayerMouseWindow();
    scrXboxPlayerMoveWindow();
} else {
    if (!active)
        exit;
    if (sprite_index == sprPClimbLedge)
        exit;
    if (keyboard_check_direct(ord(global.downkey))) {
        if (sprite_index == sprPWalkWindow) {
            image_index += 0.2;
            if (y < 528)
                y += 1;
            image_yscale = 1;
        }
        if (sprite_index == sprPWalkLedge) {
            image_index += 0.2;
            if (y < 464)
                y += 1;
            else {
                sprite_index = sprPClimbLedge;
                image_yscale = 1;
                image_index = 0;
            }
            image_yscale = 1;
        }
    }

    if (keyboard_check_direct(ord(global.upkey))) {
        if (!active)
            exit;
        if (sprite_index == sprPClimbLedge)
            exit;
        if (sprite_index == sprPWalkWindow) {
            image_index -= 0.2;
            if (y > 368)
                y -= 1;
            image_yscale = -1;
        }

        if (sprite_index == sprPWalkLedge) {
            image_index += 0.2;
            if (y > 192)
                y -= 1;
            image_yscale = 1;
        }
    }

}

