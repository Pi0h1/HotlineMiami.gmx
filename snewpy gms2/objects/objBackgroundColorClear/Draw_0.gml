dir+=0.25
color2=merge_color(c_white,c_yellow,0.5+lengthdir_x(0.5,dir*2.1245))
color1=merge_color(c_white,merge_color(merge_color(c_yellow,c_fuchsia,0.5+lengthdir_x(0.5,dir*3.12)),c_aqua,0.125+lengthdir_y(0.125,dir*1.73)),0.75+lengthdir_y(0.25,dir*1.73))
draw_rectangle_color(camera_get_view_x(view_camera[0])-60,camera_get_view_y(view_camera[0])-60,camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])+60,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])+60,color1,color1,color2,color2,0)
