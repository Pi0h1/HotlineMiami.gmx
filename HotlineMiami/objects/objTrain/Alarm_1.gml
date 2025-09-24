viewx = camera_get_view_x(view_camera[0]);
viewy = camera_get_view_y(view_camera[0]);
with (objPlayerMouseHouse) {
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.sprite_index = sprite_index;
    my_id.image_index = 0;
    my_id.dir = dir;
    my_id.active = 0;
    my_id.maskon = 1;
    my_id.maskindex = global.maskindex;
    global.maskon = 1;
    instance_destroy();
}
camera_set_view_pos(view_camera[0], viewx, viewy);

