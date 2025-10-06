vlastx = camera_get_view_x(view_camera[0]);
vlasty = camera_get_view_y(view_camera[0]);

if (instance_exists(objPlayer)) {
    camera_set_view_pos(view_camera[0], vlastx, vlasty);
}
