if image_index<12 image_index+=0.15 else {
viewx=camera_get_view_x(view_camera[0])
viewy=camera_get_view_y(view_camera[0])
my_id=instance_create(x+3,y,objPlayerHospital)
my_id.xview=viewx
my_id.yview=viewy
instance_destroy() 
camera_set_view_pos(view_camera[0], viewx, viewy)

}
