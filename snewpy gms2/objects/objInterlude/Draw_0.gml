if wait>0 wait-=1 else fade=1
dir+=0.25
color2=merge_color(c_navy,c_black,0.7+lengthdir_x(0.25,dir))
color1=merge_color(c_purple,merge_color(merge_color(c_fuchsia,c_red,0.5+lengthdir_x(0.5,dir*3.12)),c_black,0.625+lengthdir_y(0.225,dir*1.73)),0.5+lengthdir_y(0.5,dir*1.73))
d3d_set_projection_ortho(0,0,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]),0)
draw_rectangle_color(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])+60,camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]),camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])-60,color2,color2,color1,color1,0)
draw_set_blend_mode(bm_normal)
global.color=c_black
with objHouseReturn draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,global.color,image_alpha)
with objHouse draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,global.color,image_alpha)
i=0
repeat (5) {
draw_sprite_ext(sprPalmTrees,palmindex[i],palmx[i],room_height+65,1,1,0,global.color,1)
palmx[i]-=8-global.revisit*16
if global.revisit=1 {
if palmx[i]>=room_width+60 {palmx[i]=-60 palmindex[i]=floor(random(6))}
} else {
if palmx[i]<=-60 {palmx[i]=room_width+60 palmindex[i]=floor(random(6))}
}
i+=1
}



d3d_set_projection_ortho(0,0,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]),0)
draw_set_color(c_black)
draw_rectangle(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]),camera_get_view_y(view_camera[0])+60,0)
draw_rectangle(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0]),camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]),camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])-60,0)
if fade=0 {
if c_amount<180 {
c_amount+=10
color1=merge_color(c_black,merge_color(c_aqua,c_white,0.5+lengthdir_x(0.5,c_amount)),0.5+lengthdir_x(0.5,c_amount))
if c_amount>90 color2=merge_color(c_black,merge_color(c_fuchsia,c_white,abs(lengthdir_y(1,c_amount))),abs(lengthdir_y(1,c_amount))) else color2=c_white
draw_set_blend_mode(bm_subtract)
draw_rectangle_color(camera_get_view_x(view_camera[0])-10,camera_get_view_y(view_camera[0])-10,camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])+10,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])+10,color1,color2,color2,color1,0)
draw_set_blend_mode(bm_normal)
}
}

if fade=1 {
if c_amount>0  {
c_amount-=5
if global.revisit=1 { sxeasy_setVolume(c_amount*(1/180))}
color1=merge_color(c_black,merge_color(c_aqua,c_white,0.5+lengthdir_x(0.5,c_amount)),0.5+lengthdir_x(0.5,c_amount))
if c_amount>90 color2=merge_color(c_black,merge_color(c_fuchsia,c_white,abs(lengthdir_y(1,c_amount))),abs(lengthdir_y(1,c_amount))) else color2=c_white
draw_set_blend_mode(bm_subtract)
draw_rectangle_color(camera_get_view_x(view_camera[0])-10,camera_get_view_y(view_camera[0])-10,camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])+10,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])+10,color2,color1,color1,color2,0)
draw_set_blend_mode(bm_normal)
} else {
if global.revisit=1 {sxeasy_stop() sxeasy_setVolume(1) if string_length(global.song)>0 {if global.nextlevel=rmSequence12bDownstairs nothing=1 else sxeasy_play(global.song)}}
room_goto(global.interlude)
}
}



d3d_set_projection_ortho(0,0,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]),0)
draw_set_color(c_black)
//draw_rectangle(0,0,room_width,55,0)
//draw_rectangle(0,room_height,room_width,room_height-65,0)
draw_set_blend_mode(bm_subtract)
my_y=random(32)
draw_sprite_tiled(sprScanlines,0,0,my_y)
draw_set_blend_mode(bm_subtract)
draw_circle_color(camera_get_view_width(view_camera[0])/2,camera_get_view_height(view_camera[0])/2,240+random(24),c_black,merge_color(c_navy,c_aqua,0.25+random(0.25)),0)
draw_set_blend_mode(bm_normal)
