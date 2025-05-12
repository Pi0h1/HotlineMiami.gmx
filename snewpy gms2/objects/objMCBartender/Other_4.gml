vdist=point_distance(x,y,room_width/2,room_height/2)
vdir=point_direction(room_width/2,room_height/2,x,y)
camera_set_view_pos(view_camera[0], x+lengthdir_x(vdist*0.2,vdir-180)-camera_get_view_width(view_camera[0])*0.5, y+lengthdir_y(vdist*0.2,vdir-180)-camera_get_view_height(view_camera[0])*0.5)
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
with objEffector {
vlastx=camera_get_view_x(view_camera[0])
vlasty=camera_get_view_y(view_camera[0])
}

