color2=merge_color(merge_color(c_aqua,c_fuchsia,0.5+lengthdir_x(0.5,dir*2.32)),c_white,0.5+lengthdir_x(0.5,dir*3))
color1=merge_color(c_maroon,merge_color(c_aqua,c_fuchsia,0.5+lengthdir_x(0.5,dir*2.32)),0.75+lengthdir_x(0.25,dir*3))
draw_set_color(c_black)
draw_set_font(fntPointShow)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
/*draw_set_color(c_black)
draw_text_transformed(x+lengthdir_x(1,dir*4)-1,y+lengthdir_y(1,dir*4),text,scale,scale,image_angle)
draw_text_transformed(x+lengthdir_x(1,dir*4)+1,y+lengthdir_y(1,dir*4),text,scale,scale,image_angle)
draw_text_transformed(x+lengthdir_x(1,dir*4-180)+1,y+lengthdir_y(1,dir*4-180),text,scale,scale,image_angle)
draw_text_transformed(x+lengthdir_x(1,dir*4-180)-1,y+lengthdir_y(1,dir*4-180),text,scale,scale,image_angle)
draw_text_transformed(x+lengthdir_x(1,dir*4),y+lengthdir_y(1,dir*4)-1,text,scale,scale,image_angle)
draw_text_transformed(x+lengthdir_x(1,dir*4),y+lengthdir_y(1,dir*4)+1,text,scale,scale,image_angle)
draw_text_transformed(x+lengthdir_x(1,dir*4-180),y+lengthdir_y(1,dir*4-180)+1,text,scale,scale,image_angle)
draw_text_transformed(x+lengthdir_x(1,dir*4-180),y+lengthdir_y(1,dir*4-180)-1,text,scale,scale,image_angle)*/
draw_set_color(color1)
draw_text_transformed(x*3+lengthdir_x(1,dir*4)*3,y*3+lengthdir_y(1,dir*4)*3,text,scale*3,scale*3,image_angle)
draw_set_color(color2)
draw_text_transformed(x*3+lengthdir_x(1,dir*4-180)*3,y*3+lengthdir_y(1,dir*4-180)*3,text,scale*3,scale*3,image_angle)
if done=1 {
if scale>0 scale-=0.1 else instance_destroy()
vspeed+=0.2
}
if done=0 {
if scale<0.9 scale+=0.006125 else done=1
}
dir+=4
