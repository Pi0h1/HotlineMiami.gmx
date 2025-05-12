
if instance_exists(objPlayer) {
width=display_get_width()
height=display_get_height()
global.mousex=objPlayer.x+(display_mouse_get_x()-width*0.5)*(camera_get_view_width(view_camera[0])/width)
global.mousey=objPlayer.y+(display_mouse_get_y()-height*0.5)*(camera_get_view_height(view_camera[0])/height)
x=global.mousex
y=global.mousey
}

if action>0 {image_blend=merge_color(merge_color(c_aqua,c_fuchsia,0.5+lengthdir_x(0.5,global.dir*3.27)),c_white,0.5+lengthdir_y(0.5,global.dir*1.97))
draw_sprite_ext(sprCursorAction,action-1,x+1,y+1,1,1,-camera_get_view_angle(view_camera[0]),c_black,0.5)
draw_sprite_ext(sprCursorAction,action-1,x,y,1,1,-camera_get_view_angle(view_camera[0]),image_blend,1)
}



draw_sprite_ext(sprite_index,image_index,x+1,y+1,1,1,-camera_get_view_angle(view_camera[0]),c_black,0.5)
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,image_index,x,y,1,1,-camera_get_view_angle(view_camera[0]),c_white,1)
draw_set_blend_mode(bm_normal)

scrScoreDraw()
if fade=0 {
if amount<180 {
amount+=5
color1=merge_color(c_black,merge_color(c_aqua,c_white,0.5+lengthdir_x(0.5,amount)),0.5+lengthdir_x(0.5,amount))
if amount>90 color2=merge_color(c_black,merge_color(c_fuchsia,c_white,abs(lengthdir_y(1,amount))),abs(lengthdir_y(1,amount))) else color2=c_white
draw_set_blend_mode(bm_subtract)
draw_rectangle_color(-10,-10,camera_get_view_width(view_camera[0])+10,camera_get_view_height(view_camera[0])+10,color1,color2,color2,color1,0)
draw_set_blend_mode(bm_normal)
}
}

if fade=1 {
if amount>0  {
amount-=10
if restart=1 {
sxeasy_setVolume(amount*(1/180)*0)
}
color1=merge_color(c_black,merge_color(c_aqua,c_white,0.5+lengthdir_x(0.5,amount)),0.5+lengthdir_x(0.5,amount))
if amount>90 color2=merge_color(c_black,merge_color(c_fuchsia,c_white,abs(lengthdir_y(1,amount))),abs(lengthdir_y(1,amount))) else color2=c_white
draw_set_blend_mode(bm_subtract)
draw_rectangle_color(-10,-10,camera_get_view_width(view_camera[0])+10,camera_get_view_height(view_camera[0])+10,color2,color1,color1,color2,0)
draw_set_blend_mode(bm_normal)
} else {fade=0 if restart=1 {sxeasy_stop(1) sxeasy_setVolume(0) sxeasy_play(working_directory+"\\HorseSteppin.mp3"); room=rmMenu} else {if next=1 room=nextroom else room_restart()}}
}
coldir+=1

draw_set_blend_mode(bm_subtract)
draw_sprite_tiled(sprScanlines,0,0,my_y)
my_y=random(32)
draw_set_blend_mode(bm_subtract)
draw_circle_color(camera_get_view_width(view_camera[0])/2,camera_get_view_height(view_camera[0])/2,240+random(24)+24,c_black,merge_color(c_navy,c_aqua,0.25+random(0.25)),0)
draw_set_blend_mode(bm_normal)

