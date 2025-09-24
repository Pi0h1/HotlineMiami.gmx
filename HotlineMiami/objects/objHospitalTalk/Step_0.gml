if (!instance_exists(objPhoneConversation)) {
    if (reload > 0)
        reload--;
    else {
        reload = 10;
        if (talk < talks) {
            scrGetMessage(talk);
            objEffector.image_xscale = 1.5;
            objEffector.image_yscale = 1.5;
            talk++;
        } else {
            objEffector.fade = 1;
            objEffector.next = 1;
            objEffector.nextroom = room_next(room);
        }
    }
} else {
    if (frac(talk * 0.5) > 0)
        object = objPoliceTalk;
    else object = objDoctorTalk;
    with (object) {
        image_index += 0.1;
        valid = 0;
        vdist = point_distance(x, y, room_width / 2 - (1 - valid) * 88, room_height / 2);
        vdir = point_direction(room_width / 2 - (1 - valid) * 88, room_height / 2, x, y);
        viewspeed = point_distance(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - (1 - valid) * 88, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2, x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
        viewdir = point_direction(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - (1 - valid) * 88, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2, x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
        camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed, viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed, viewdir)));
        camera_set_view_angle(view_camera[0], lengthdir_y(vdist * (1 / 160), vdir * 2));
    }
}

