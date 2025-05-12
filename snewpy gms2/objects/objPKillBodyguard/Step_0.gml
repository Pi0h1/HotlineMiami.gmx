if image_index<37 image_index+=0.2 else {
my_id=instance_create(x,y,objBodyguardCrawl)
my_id.image_angle=image_angle
instance_destroy()
exit
}
if image_index>4.85 and image_index<5.1 {audio_play_sound(sndWeaponHit,0,false) global.shake=5}
if image_index>7.85 and image_index<8.1 {audio_play_sound(sndWeaponHit,0,false) global.shake=5}
if image_index>20.85 and image_index<21.1 {audio_play_sound(sndWeaponHit,0,false) global.shake=5}
if image_index>24.85 and image_index<25.1 {audio_play_sound(sndWeaponHit,0,false) global.shake=5}

if image_index>=33 {
if !instance_exists(objPlayerMouse) {
my_id=instance_create(x,y,objPlayerMouse)
my_id.reload=30
my_id.myxspeed=lengthdir_x(3,image_angle-180)
my_id.myyspeed=lengthdir_y(3,image_angle-180)
global.dir=image_angle-180
}
}







vdist=point_distance(x,y,room_width/2,room_height/2)
vdir=point_direction(room_width/2,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))

