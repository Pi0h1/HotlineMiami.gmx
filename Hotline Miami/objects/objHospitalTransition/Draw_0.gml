dir+=0.25
color2=merge_color(c_red,c_orange,0.7+lengthdir_x(0.25,dir))
color1=merge_color(c_yellow,merge_color(merge_color(c_white,c_fuchsia,0.25+lengthdir_x(0.2,dir*3.12)),c_white,0.625+lengthdir_y(0.225,dir*1.73)),0.5+lengthdir_y(0.5,dir*1.73))
d3d_set_projection_ortho(0,0,__view_get( e__VW.WView, 0 ),__view_get( e__VW.HView, 0 ),0)
draw_rectangle_color(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])+60,camera_get_view_x(view_camera[0])+__view_get( e__VW.WView, 0 ),camera_get_view_y(view_camera[0])+__view_get( e__VW.HView, 0 )-60,color2,color2,color1,color1,0)
draw_set_blend_mode(bm_normal)
global.color=c_black
d3d_set_projection_ortho(0,0,__view_get( e__VW.WView, 0 ),__view_get( e__VW.HView, 0 ),lengthdir_x(3.5,dir*4))
with objHouseReturn draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,global.color,image_alpha)
with objHouse draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,global.color,image_alpha)
i=0
repeat (5) {
draw_sprite_ext(sprPalmTrees,palmindex[i],palmx[i],room_height+65,1,1,0,global.color,1)
palmx[i]+=2
if palmx[i]>=room_width+60 {palmx[i]=-60 palmindex[i]=floor(random(6))}
i+=1
}



d3d_set_projection_ortho(0,0,__view_get( e__VW.WView, 0 ),__view_get( e__VW.HView, 0 ),0)
if fade=0 {
if c_amount<180 {
c_amount+=10
color1=merge_color(c_black,merge_color(c_aqua,c_white,0.5+lengthdir_x(0.5,c_amount)),0.5+lengthdir_x(0.5,c_amount))
if c_amount>90 color2=merge_color(c_black,merge_color(c_fuchsia,c_white,abs(lengthdir_y(1,c_amount))),abs(lengthdir_y(1,c_amount))) else color2=c_white
draw_set_blend_mode(bm_subtract)
draw_rectangle_color(camera_get_view_x(view_camera[0])-10,camera_get_view_y(view_camera[0])-10,camera_get_view_x(view_camera[0])+__view_get( e__VW.WView, 0 )+10,camera_get_view_y(view_camera[0])+__view_get( e__VW.HView, 0 )+10,color1,color2,color2,color1,0)
draw_set_blend_mode(bm_normal)
}
}

if fade=1 {
if c_amount>0  {
c_amount-=5
color1=merge_color(c_black,merge_color(c_aqua,c_white,0.5+lengthdir_x(0.5,c_amount)),0.5+lengthdir_x(0.5,c_amount))
if c_amount>90 color2=merge_color(c_black,merge_color(c_fuchsia,c_white,abs(lengthdir_y(1,c_amount))),abs(lengthdir_y(1,c_amount))) else color2=c_white
draw_set_blend_mode(bm_subtract)
draw_rectangle_color(camera_get_view_x(view_camera[0])-10,camera_get_view_y(view_camera[0])-10,camera_get_view_x(view_camera[0])+__view_get( e__VW.WView, 0 )+10,camera_get_view_y(view_camera[0])+__view_get( e__VW.HView, 0 )+10,color2,color1,color1,color2,0)
draw_set_blend_mode(bm_normal)
} else {
room_goto(rmSequence13Downstairs)
}
}

if state=0 {
if blackx>110 blackx-=0.25 else state=1
}
if state=1 {
if blackx<140 blackx+=1 else state=2
}
if state=2 {
if blackx>60 blackx-=0.5 else {if wait>0 wait-=1 else state=3}
}
if state=3 {
if blackx<140 blackx+=1 else state=4
}
if state=4 {
if blackx>80 blackx-=0.25 else state=5
}
if state=5 {
if blackx<140 blackx+=0.5 else state=6
}
if state=6 {
if blackx>119 blackx-=0.25 else state=7
}
if state=7 {
if blackx<140 blackx+=0.5 else room_goto(rmSequence13Downstairs)
}

draw_set_color(c_black)
alpha+=0.05-random(0.1)
if alpha>1 alpha=1
if alpha<0 alpha=0
draw_set_blend_mode(bm_add)
draw_sprite_tiled_ext(sprNoise,dir,x,y,1,1,merge_color(c_black,make_color_hsv(random(255),random(255),random(255)),alpha),1)
draw_set_blend_mode(bm_normal)
draw_rectangle(0,0,room_width,blackx,0)
draw_rectangle(0,room_height,room_width,room_height-blackx,0)
draw_set_blend_mode(bm_subtract)
my_y=random(32)
draw_sprite_tiled(sprScanlines,0,0,my_y)
draw_set_blend_mode(bm_subtract)
draw_circle_color(__view_get( e__VW.WView, 0 )/2,__view_get( e__VW.HView, 0 )/2,240+random(24),c_black,merge_color(c_navy,c_aqua,0.25+random(0.25)),0)
draw_set_blend_mode(bm_normal)
