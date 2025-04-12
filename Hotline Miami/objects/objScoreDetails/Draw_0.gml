
dir2+=0.25
color2=make_color_hsv(0,255,15)
color1=merge_color(c_yellow,merge_color(merge_color(c_fuchsia,c_red,0.5+lengthdir_x(0.5,dir2*3.12)),c_maroon,0.125+lengthdir_y(0.125,dir2*1.73)),0.5+lengthdir_y(0.5,dir2*1.73))
d3d_set_projection_ortho(0,0,__view_get( e__VW.WView, 0 ),__view_get( e__VW.HView, 0 ),0)
draw_rectangle_color(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])+40,camera_get_view_x(view_camera[0])+__view_get( e__VW.WView, 0 ),camera_get_view_y(view_camera[0])+__view_get( e__VW.HView, 0 )-40,color2,color2,color1,color1,0)


color3=merge_color(c_orange,c_yellow,0.5+lengthdir_x(0.5,dir2*3))
draw_set_color(merge_color(color1,color3,0.5))
draw_circle(room_width/2,room_height*0.6,63,0)
draw_circle_color(room_width/2,room_height*0.6,60,merge_color(c_white,c_yellow,0.25+lengthdir_x(0.25,dir2*2)),merge_color(c_orange,c_yellow,0.5+lengthdir_x(0.5,dir2*3)),0)
global.color=merge_color(color3,color1,0.5)
draw_rectangle_color(camera_get_view_x(view_camera[0]),room_height*0.6,camera_get_view_x(view_camera[0])+__view_get( e__VW.WView, 0 ),camera_get_view_y(view_camera[0])+__view_get( e__VW.HView, 0 )-40,color1,color1,color2,color2,0)
with objWave {
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,merge_color(global.color,c_white,0.5+lengthdir_x(0.5,dir)),image_alpha)
}

draw_set_blend_mode(bm_subtract)
draw_rectangle_color(camera_get_view_x(view_camera[0]),__view_get( e__VW.HView, 0 )-39,camera_get_view_x(view_camera[0])+__view_get( e__VW.WView, 0 ),camera_get_view_y(view_camera[0])+__view_get( e__VW.HView, 0 )-50,c_black,c_black,c_white,c_white,0)
draw_set_blend_mode(bm_normal)
if housex>-144 housex-=0.05 else housex+=144
i=0 repeat (11) {
draw_sprite_ext(sprHouseSilhouettes,1,housex*0.666+i*48,room_height*0.6-2,1,1,0,merge_color(c_black,global.color,0.25),1)
draw_sprite_ext(sprHouseSilhouettes,0,housex*0.333+i*48,room_height*0.6-1,1,1,0,merge_color(c_black,global.color,0.5),1)
draw_sprite_ext(sprHouseSilhouettes,0,housex+i*48,room_height*0.6,1,1,0,merge_color(c_black,global.color,0.75),1)
i+=1
}


draw_surface_ext(global.surf1,-1,0,1,1,0,c_black,1)
draw_surface_ext(global.surf1,1,0,1,1,0,c_black,1)
draw_surface_ext(global.surf1,0,-1,1,1,0,c_black,1)
draw_surface_ext(global.surf1,0,1,1,1,0,c_black,1)
draw_surface_ext(global.surf1,0,0,1,1,0,c_white,1)
if alpha>0 {
draw_set_alpha(alpha)
alpha-=0.1
draw_set_color(c_white)
draw_rectangle(0,0,room_width,room_height,0)
draw_set_alpha(1)
}

d3d_set_projection_ortho(0,0,__view_get( e__VW.WView, 0 ),__view_get( e__VW.HView, 0 ),0)
__view_set( e__VW.Angle, 0, lengthdir_y(2,dir*2.33) )
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
if (global.myscore>=real(string_digits(parscore)) and global.masks[global.currentmask]=0) or global.newguns>0 or global.newmasks>0 nothing=1 else sxeasy_setVolume(c_amount*(1/180))
c_amount-=5
color1=merge_color(c_black,merge_color(c_aqua,c_white,0.5+lengthdir_x(0.5,c_amount)),0.5+lengthdir_x(0.5,c_amount))
if c_amount>90 color2=merge_color(c_black,merge_color(c_fuchsia,c_white,abs(lengthdir_y(1,c_amount))),abs(lengthdir_y(1,c_amount))) else color2=c_white
draw_set_blend_mode(bm_subtract)
draw_rectangle_color(camera_get_view_x(view_camera[0])-10,camera_get_view_y(view_camera[0])-10,camera_get_view_x(view_camera[0])+__view_get( e__VW.WView, 0 )+10,camera_get_view_y(view_camera[0])+__view_get( e__VW.HView, 0 )+10,color2,color1,color1,color2,0)
draw_set_blend_mode(bm_normal)
} else {
global.levels[scrGetCurrentLevel()]=1
if (global.myscore>=real(string_digits(parscore)) and global.masks[global.currentmask]=0 and scrGradeToNumber(lastgrade)>=7) or global.newmasks>0 {next=rmUnlock} else {if global.newguns>0 next=rmWeaponUnlock else next=scrGetSequence(global.sequence)}
ds_list_clear(global.bonuslist)
if next=rmUnlock or next=rmWeaponUnlock nothing=1 else {
sxeasy_stop(1) 
sxeasy_setVolume(0) 
sxeasy_play(song)
scrResetScore() 
scrSaveUnlocked()
}
room_goto(next)
}

}



d3d_set_projection_ortho(0,0,__view_get( e__VW.WView, 0 ),__view_get( e__VW.HView, 0 ),0)
draw_set_color(c_black)
//draw_rectangle(0,0,room_width,55,0)
//draw_rectangle(0,room_height,room_width,room_height-65,0)
draw_set_blend_mode(bm_subtract)
my_y=random(32)
draw_sprite_tiled(sprScanlines,0,0,my_y)
draw_set_blend_mode(bm_subtract)
draw_circle_color(__view_get( e__VW.WView, 0 )/2,__view_get( e__VW.HView, 0 )/2,240+random(24),c_black,merge_color(c_navy,c_aqua,0.25+random(0.25)),0)
draw_set_blend_mode(bm_normal)
