if (!smirked) {
    if (point_distance(x, y, objPlayer.x, objPlayer.y) < 220) {
        scrGetMessage(0);
        objPlayerBikerHouse.active = 0;
        smirked = 1;
    }
}

if (smirked) {
    if (instance_exists(objPhoneConversation)) {
        addx = 80;
        viewspeed = point_distance(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, x + addx, y) * 0.1;
        viewdir = point_direction(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, x + addx, y);

        __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (lengthdir_x(viewspeed, viewdir)) );
        __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (lengthdir_y(viewspeed, viewdir)) );

        vdist = point_distance(x, y, room_width / 2, room_height / 2);
        vdir = point_direction(room_width / 2, room_height / 2, x, y);
        __view_set( e__VW.Angle, 0, lengthdir_y(vdist * (1 / 160), vdir * 2) );

        if (vol > 0.35)
            vol -= 0.01;
        sxeasy_setVolume(vol);
    } else {
        if (vol < 1) {
            vol += 0.05;
            sxeasy_setVolume(vol);
        }
        if (sprite_index == sprJanitorClean) {
            sprite_index = sprJanitorMop;
            my_id = instance_create(x - 8, y, objJanitorFlee);
            my_id.hspeed = -0.5;
        }
    }
    if (sprite_index == sprJanitorMop) {
        if (!instance_exists(objJanitorFlee))
            smirked = 2;
    }
}

