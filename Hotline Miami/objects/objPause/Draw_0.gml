//d3d_set_projection_ortho(0,0,399,255,0)
if sprite_exists(global.sprite) {
if on>0 {
if blur<1 blur+=0.1
if blacky<1 blacky+=0.05
} else {
if on=0 {
if blur>0 blur-=0.05 
if blacky>0 blacky-=0.05 else {
if sprite_exists(global.sprite) sprite_delete(global.sprite)
if file_exists(working_directory+"\\pause.bmp") file_delete(working_directory+"\\pause.bmp")
room=global.lastroom
exit
}
}
}
color1=merge_color(c_red,c_aqua,0.5+lengthdir_x(0.5,dir))
color2=make_color_hsv(0,0,45+lengthdir_x(20,dir*3))
myx=lengthdir_x(0.5*blur,dir*1.35)
myy=lengthdir_y(0.5*blur,dir*1.35)
merge_color(c_black,color2,blur)
dir+=2
if width<1200 {
draw_sprite_ext(global.sprite,0,myx,myy,lowres,lowres,0,merge_color(c_white,color1,blur*0.5),0.8+lengthdir_x(0.2,dir))
draw_sprite_ext(global.sprite,0,-myx,-myy,lowres,lowres,0,merge_color(c_white,color1,blur*0.5),0.8-lengthdir_x(0.2,dir))
} else {
draw_sprite_ext(global.sprite,0,myx,myy,1/3,1/3,0,merge_color(c_white,color1,blur*0.5),0.8+lengthdir_x(0.2,dir))
draw_sprite_ext(global.sprite,0,-myx,-myy,1/3,1/3,0,merge_color(c_white,color1,blur*0.5),0.8-lengthdir_x(0.2,dir))
}
/*draw_set_blend_mode(bm_normal)
if blur>0 {
i=0
repeat (8) {
draw_sprite_ext(global.sprite,0,myx+lengthdir_x(0.5*blur,i*45),myy+lengthdir_y(0.5*blur,i*45),1/3,1/3,0,c_white,0.25-random(0.05))
i+=3
}
i=0
repeat (8) {
draw_sprite_ext(global.sprite,0,myx+lengthdir_x(1*blur,i*45),myy+lengthdir_y(1*blur,i*45),1/3,1/3,0,c_white,0.15-random(0.05))
i+=3
}
}*/
}
if surface_exists(global.surf1) {
draw_surface_ext(global.surf1,-1,0,1,1,0,c_black,1)
draw_surface_ext(global.surf1,1,0,1,1,0,c_black,1)
draw_surface_ext(global.surf1,0,1,1,1,0,c_black,1)
draw_surface_ext(global.surf1,0,-1,1,1,0,c_black,1)

draw_surface_ext(global.surf1,0,0,1,1,0,c_white,1)
}

if fade=1 {
if c_amount>0  {
c_amount-=5
sxeasy_setVolume(c_amount*((1-blur*0.5)/180))
color1=merge_color(c_black,merge_color(c_aqua,c_white,0.5+lengthdir_x(0.5,c_amount)),0.5+lengthdir_x(0.5,c_amount))
if c_amount>90 color2=merge_color(c_black,merge_color(c_fuchsia,c_white,abs(lengthdir_y(1,c_amount))),abs(lengthdir_y(1,c_amount))) else color2=c_white
draw_set_blend_mode(bm_subtract)
draw_rectangle_color(camera_get_view_x(view_camera[0])-10,camera_get_view_y(view_camera[0])-10,camera_get_view_x(view_camera[0])+__view_get( e__VW.WView, 0 )+10,camera_get_view_y(view_camera[0])+__view_get( e__VW.HView, 0 )+10,color2,color1,color1,color2,0)
draw_set_blend_mode(bm_normal)
} else { sxeasy_stop(1) sxeasy_setVolume(0) bgm_Close() game_restart()
}
} else {
sxeasy_setVolume(1-blur*0.5)
}

draw_set_blend_mode(bm_subtract)
my_y=random(32)
draw_sprite_tiled(sprScanlines,0,0,my_y)
draw_set_blend_mode(bm_subtract)
draw_circle_color(__view_get( e__VW.WView, 0 )/2,__view_get( e__VW.HView, 0 )/2,240+random(24),c_black,merge_color(c_navy,c_aqua,0.25+random(0.25)),0)
draw_set_blend_mode(bm_normal)
draw_set_color(c_black)
draw_rectangle(0,0,room_width+1,44*blacky,0)
draw_rectangle(0,room_height-44*blacky,room_width+1,room_height,0)


/* */
/*  */
