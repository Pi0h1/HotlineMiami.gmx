if strobeon=1 global.strobe=!global.strobe else global.strobe=1
surface_set_target(surf)
d3d_set_projection_ortho(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]),camera_get_view_angle(view_camera[0]))
draw_clear(c_gray)
draw_set_blend_mode(bm_subtract)
with objDiscoLight {
i=0
repeat (4)
{
color=merge_color(c_yellow,c_orange,0.5+lengthdir_x(0.5,dir*0.71+i*90))
if global.strobe draw_triangle_color(x+lengthdir_x(5,dir+i*90),y+lengthdir_y(5,dir+i*90),x+lengthdir_x(80,dir-25+i*90),y+lengthdir_y(80,dir-25+i*90),x+lengthdir_x(80,dir+25+i*90),y+lengthdir_y(80,dir+25+i*90),color,c_black,c_black,0)
i+=1
}
dir+=4
}
with objSpotlight {
if global.strobe draw_circle_color(x,y,16*image_xscale,merge_color(color,c_black,0.5),color,0)
if global.strobe draw_triangle_color(startx+lengthdir_x(5,image_angle),starty+lengthdir_y(5,image_angle),x+lengthdir_x(image_xscale*16,image_angle+90),y+lengthdir_y(image_xscale*16,image_angle+90),x+lengthdir_x(image_xscale*16,image_angle-90),y+lengthdir_y(image_xscale*16,image_angle-90),color,merge_color(c_black,color,0.5),merge_color(c_black,color,0.5),0)
}
draw_set_blend_mode(bm_normal)
surface_reset_target()

