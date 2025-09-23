if (instance_exists(objEnemy)) {
    clear = 0;
} else clear = 1;
if (global.paused) {
    exit;
}
if (!instance_exists(objEffector))
    instance_create(x, y, objEffector);
if (!instance_exists(objBackgroundColor)) {
    if (room == rmJanitors) {
        with (objBackgroundColor)
            instance_destroy();
    } else instance_create(x, y, objBackgroundColor);
}
if (!instance_exists(objSurfacer))
    instance_create(x, y, objSurfacer);
if (persistent) {
    __view_set( e__VW.XView, 0, xview );
    __view_set( e__VW.YView, 0, yview );
    with (objEffector) {
        vlastx = __view_get( e__VW.XView, 0 );
        vlasty = __view_get( e__VW.YView, 0 );
    }
    alarm[0] = 36;
} else {
    vdist = point_distance(x, y, room_width / 2, room_height / 2);
    vdir = point_direction(room_width / 2, room_height / 2, x, y);
    __view_set( e__VW.XView, 0, x + lengthdir_x(vdist * 0.2, vdir - 180) - __view_get( e__VW.WView, 0 ) * 0.5 );
    __view_set( e__VW.YView, 0, y + lengthdir_y(vdist * 0.2, vdir - 180) - __view_get( e__VW.HView, 0 ) * 0.5 );
    __view_set( e__VW.Angle, 0, lengthdir_y(vdist * (1 / 160), vdir * 2) );
    with (objEffector) {
        vlastx = __view_get( e__VW.XView, 0 );
        vlasty = __view_get( e__VW.YView, 0 );
    }
}

