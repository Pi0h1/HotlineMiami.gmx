if objPlayer.persistent=1 {
alarm[0]=2 exit
}
viewx=camera_get_view_x(view_camera[0])
viewy=camera_get_view_y(view_camera[0])
with objPlayerMouse {
my_id=instance_create(x,y,objPlayerMouseHouse)
my_id.sprite_index=sprPWalkBag
my_id.image_index=0
my_id.dir=dir
my_id.active=0
my_id.maskon=1
my_id.maskindex=global.maskindex
instance_destroy()
}
camera_set_view_pos(view_camera[0], viewx, viewy)
alarm[1]=100
