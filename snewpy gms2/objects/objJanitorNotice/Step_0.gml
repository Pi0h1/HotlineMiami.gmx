if smirked=0 {
if point_distance(x,y,objPlayer.x,objPlayer.y)<220 {
scrGetMessage(0)
objPlayerBikerHouse.active=0
smirked=1
}
}

if smirked=1 {
if instance_exists(objPhoneConversation) {
addx=80
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+addx,y)*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+addx,y)

camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))

vdist=point_distance(x,y,room_width/2,room_height/2)
vdir=point_direction(room_width/2,room_height/2,x,y)
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))

if vol>0.35 vol-=0.01
sxeasy_setVolume(vol)
} else {
if vol<1 {
vol+=0.05
sxeasy_setVolume(vol)
}
if sprite_index=sprJanitorClean {
sprite_index=sprJanitorMop
my_id=instance_create(x-8,y,objJanitorFlee)
my_id.hspeed=-0.5
}
}
if sprite_index=sprJanitorMop {
if !instance_exists(objJanitorFlee) smirked=2
}
}
