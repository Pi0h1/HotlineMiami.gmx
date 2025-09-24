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
if (persistent ) {
    camera_set_view_pos(view_camera[0], xview, yview);
    with (objEffector) {
        vlastx = camera_get_view_x(view_camera[0]);
        vlasty = camera_get_view_y(view_camera[0]);
    }
    alarm[0] = 36;
} else {
    vdist = point_distance(x, y, room_width / 2, room_height / 2);
    vdir = point_direction(room_width / 2, room_height / 2, x, y);
    camera_set_view_pos(view_camera[0], x + lengthdir_x(vdist * 0.2, vdir - 180) - camera_get_view_width(view_camera[0]) * 0.5, y + lengthdir_y(vdist * 0.2, vdir - 180) - camera_get_view_height(view_camera[0]) * 0.5);
    camera_set_view_angle(view_camera[0], lengthdir_y(vdist * (1 / 160), vdir * 2));
    with (objEffector) {
        vlastx = camera_get_view_x(view_camera[0]);
        vlasty = camera_get_view_y(view_camera[0]);
    }
}

