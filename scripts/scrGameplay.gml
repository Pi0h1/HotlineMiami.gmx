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

if room=rmHotelSuite {
with objWindowFrameV {
if sprite_index=sprWindowSill nothing=1 else {
if x=480 and y=256 {
draw_sprite_ext(sprArrow,0,x-12+lengthdir_x(3,objBackgroundColor.dir*32),y+16,1,1,90,c_white,1)
}
}
}
}

//Cursor was here

if keyboard_check(vk_control) {
    if mouse_check_button(mb_right) {
    draw_sprite_ext(sprUIEraser,eraser_index,objEffector.x,objEffector.y,0.5,0.5,0,c_white,1)
    }
}
eraser_index+=0.2

with objDiscoLights {
d3d_set_projection_ortho(0,0,view_wview[0],view_hview[0],0)
draw_set_blend_mode(bm_subtract)
draw_surface(surf,0,0)
}
draw_set_blend_mode(bm_normal)

// global.time stores how long it took you to beat a level
if !instance_exists(objMaskMenu) and !instance_exists(objPhoneConversation) {global.time+=1}

if instance_exists(objPlayerMouseHouse) or instance_exists(objPhoneConversation) exit

scrDrawHUD()
if instance_exists(objMaskMenu) scrDrawMaskMenu() else {
    if leveltitle!=""{
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

// Black bars
if blackx>0 {
draw_set_color(c_black)
draw_rectangle(0,0,view_wview[0],blackx,0)
draw_rectangle(0,view_hview[0],view_wview[0],view_hview[0]-blackx*1.5,0)
blackx-=3
}

if instance_exists(objPlayerJacket) {
view_xview[0]=vlastx
view_yview[0]=vlasty
}



