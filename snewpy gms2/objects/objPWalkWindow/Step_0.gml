valid=1
vdist=point_distance(x,y,room_width/2-(1-valid)*88,room_height/2)
vdir=point_direction(room_width/2-(1-valid)*88,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
if instance_exists(objDizzy) camera_set_view_angle(view_camera[0], lengthdir_y(objDizzy.dizziness*20,lengthdir_x(objDizzy.dizziness*30,global.dir*3))) else {
vdist=point_distance(x,y,room_width/2,room_height/2)
vdir=point_direction(room_width/2,room_height/2,x,y)
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}
if sprite_index=sprPClimbLedge {
if image_index<10 image_index+=0.2 else {
instance_create(x+30,y+34,objPlayerMouse)
instance_destroy()
}
}

if global.xbox=1 {
scrXboxPlayerMouseWindow()
scrXboxPlayerMoveWindow()
} else {
if active=0 exit
if sprite_index=sprPClimbLedge exit
if keyboard_check_direct(ord(global.downkey)) {
if sprite_index=sprPWalkWindow {
image_index+=0.2
if y<528 y+=1
image_yscale=1
}
if sprite_index=sprPWalkLedge {
image_index+=0.2
if y<464 y+=1 else {sprite_index=sprPClimbLedge image_yscale=1 image_index=0}
image_yscale=1
}
}

if keyboard_check_direct(ord(global.upkey)) {
if active=0 exit
if sprite_index=sprPClimbLedge exit
if sprite_index=sprPWalkWindow {
image_index-=0.2
if y>368 y-=1
image_yscale=-1
}

if sprite_index=sprPWalkLedge {
image_index+=0.2
if y>192 y-=1
image_yscale=1
}
}

}
