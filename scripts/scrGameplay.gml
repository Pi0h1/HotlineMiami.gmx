if gridon=1 {draw_set_alpha(0.25) mp_grid_draw(global.grid) draw_set_alpha(1)}
if instance_exists(objPlayer) {
width=display_get_width()
height=display_get_height()
factor=1
if keyboard_check_direct(vk_shift) factor=1.8
global.mousex=objPlayer.x+((display_mouse_get_x()-width*0.5)*(view_wview[0]/width))*factor
global.mousey=objPlayer.y+((display_mouse_get_y()-height*0.5)*(view_hview[0]/height))*factor
x=global.mousex
y=global.mousey
if instance_exists(global.enemy) {
global.mousex=global.enemy.x
global.mousey=global.enemy.y
} else global.enemy=-1234
}
if action>0 {image_blend=merge_color(merge_color(c_aqua,c_fuchsia,0.5+lengthdir_x(0.5,global.dir*3.27)),c_white,0.5+lengthdir_y(0.5,global.dir*1.97))
draw_sprite_ext(sprCursorAction,action-1,global.mousex+1,global.mousey+1,1,1,-view_angle[0],c_black,0.5)
draw_sprite_ext(sprCursorAction,action-1,global.mousex,global.mousey,1,1,-view_angle[0],image_blend,1)
}
if room=rmHotelSuite {
with objWindowFrameV {
if sprite_index=sprWindowSill nothing=1 else {
if x=480 and y=256 {
draw_sprite_ext(sprArrow,0,x-12+lengthdir_x(3,objBackgroundColor.dir*32),y+16,1,1,90,c_white,1)
}
}
}
}
draw_sprite_ext(sprite_index,image_index,global.mousex+1,global.mousey+1,1,1,-view_angle[0],c_black,0.5)
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,image_index,global.mousex,global.mousey,1,1,-view_angle[0],c_white,1)
draw_set_blend_mode(bm_normal)
with objDiscoLights {
d3d_set_projection_ortho(0,0,view_wview[0],view_hview[0],0)
draw_set_blend_mode(bm_subtract)
draw_surface(surf,0,0)
}
draw_set_blend_mode(bm_normal)
if !instance_exists(objMaskMenu) and !instance_exists(objPhoneConversation) global.time+=1
scrDrawHUD()

if instance_exists(objMaskMenu) scrDrawMaskMenu() else {
if leveltitle="" nothing=1 else {
if levelshow>0 levelshow-=1 else leveltitle=""
draw_set_font(fntDate)
draw_set_halign(fa_center)
draw_set_valign(fa_top)
if levelshow>180 draw_set_alpha((240-levelshow)*(1/60))
if levelshow<60 draw_set_alpha(levelshow*(1/60))
draw_set_color(c_black)
draw_text(view_wview[0]/2+1,view_hview[0]*0.7+1,leveltitle)
draw_set_color(c_white)
draw_text(view_wview[0]/2,view_hview[0]*0.7,leveltitle)
draw_set_alpha(1)
}
}
if fade=0 {
if amount<180 {
color1=merge_color(c_black,merge_color(c_aqua,c_white,0.5+lengthdir_x(0.5,amount)),0.5+lengthdir_x(0.5,amount))
if amount>90 color2=merge_color(c_black,merge_color(c_fuchsia,c_white,abs(lengthdir_y(1,amount))),abs(lengthdir_y(1,amount))) else color2=c_white
draw_set_blend_mode(bm_subtract)
draw_rectangle_color(-10,-10,view_wview[0]+10,view_hview[0]+10,color1,color2,color2,color1,0)
draw_set_blend_mode(bm_normal)
}
}
if fade=1 {
color1=merge_color(c_black,merge_color(c_aqua,c_white,0.5+lengthdir_x(0.5,amount)),0.5+lengthdir_x(0.5,amount))
if amount>90 color2=merge_color(c_black,merge_color(c_fuchsia,c_white,abs(lengthdir_y(1,amount))),abs(lengthdir_y(1,amount))) else color2=c_white
draw_set_blend_mode(bm_subtract)
draw_rectangle_color(-10,-10,view_wview[0]+10,view_hview[0]+10,color2,color1,color1,color2,0)
draw_set_blend_mode(bm_normal)
}
coldir+=1

scrDrawPlayer();
scrDrawFilterOscar();
scrDrawFilter();

if instance_exists(objPlayerJacket) {
view_xview[0]=vlastx
view_yview[0]=vlasty
}
if blackx>0 {
draw_set_color(c_black)
draw_rectangle(0,0,view_wview[0],blackx,0)
draw_rectangle(0,view_hview[0],view_wview[0],view_hview[0]-blackx*1.5,0)
blackx-=3
}


