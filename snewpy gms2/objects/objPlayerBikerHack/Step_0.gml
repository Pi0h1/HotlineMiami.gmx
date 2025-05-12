with objPlayerBoss {
if !instance_exists(objPhoneConversation) {
addx=0
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+addx,y)*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+addx,y)

camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))

vdist=point_distance(x,y,room_width/2,room_height/2)
vdir=point_direction(room_width/2,room_height/2,x,y)
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}
}
