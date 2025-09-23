if active = 0 {
    // do nothing.
} else {
    if (global.xbox)
        scrXboxBikerHouseMouse();

    if (!global.xbox)
        aimfar = keyboard_check_direct(vk_shift);
    else aimfar = checkbutton(0, getid(9));
    factor = 1;
    if (aimfar) {
        if (global.xbox) {
            viewx = objPlayer.x + rightthumb_x(0) * 0.0045;
            viewy = objPlayer.y - rightthumb_y(0) * 0.003;
        } else {
            viewx = objPlayer.x + ((display_mouse_get_x() - display_get_width() * 0.5) * (__view_get( e__VW.WView, 0 ) / display_get_width())) * factor;
            viewy = objPlayer.y + ((display_mouse_get_y() - display_get_height() * 0.5) * (__view_get( e__VW.HView, 0 ) / display_get_height())) * factor;
        }
        viewspeed = point_distance(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, viewx, viewy) * 0.1;
        viewdir = point_direction(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, viewx, viewy);
        __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (lengthdir_x(viewspeed, viewdir)) );
        __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (lengthdir_y(viewspeed, viewdir)) );
        vdist = point_distance(x, y, room_width / 2, room_height / 2);
        vdir = point_direction(room_width / 2, room_height / 2, x, y);
        __view_set( e__VW.Angle, 0, lengthdir_y(vdist * (1 / 160), vdir * 2) );
    } else {
        viewspeed = point_distance(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, x + lengthdir_x(24, dir), y + lengthdir_y(24, dir)) * 0.1;
        viewdir = point_direction(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, x + lengthdir_x(24, dir), y + lengthdir_y(24, dir));

        __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (lengthdir_x(viewspeed, viewdir)) );
        __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (lengthdir_y(viewspeed, viewdir)) );

        vdist = point_distance(x, y, room_width / 2, room_height / 2);
        vdir = point_direction(room_width / 2, room_height / 2, x, y);
        __view_set( e__VW.Angle, 0, lengthdir_y(vdist * (1 / 160), vdir * 2) );
    }

    xview = __view_get( e__VW.XView, 0 );
    yview = __view_get( e__VW.YView, 0 );
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

    scrPlayerMoveKeyboard();
}

if (sprite_index == sprMCWalkNoHelmet && global.done) {
    if (room == rmMCSequence2Downstairs || room == rmMCSequence3Downstairs || room == rmMCSequence4Downstairs) {
        if (instance_exists(objMCBike)) {
            if (point_distance(x, y, objMCBike.x, objMCBike.y) < 34) {
                active = 0;
                image_index = 0;
                legindex = 0;
                sprite_index = sprMCPutOnHelmet;
            }
        }
    }
}

if (sprite_index == sprMCPutOnHelmet) {
    if (image_index < 3) {
        image_index += 0.1;
    } else {
        sprite_index = sprBoss2Walk;
        image_index = 0;
        active = 1;
    }
}

