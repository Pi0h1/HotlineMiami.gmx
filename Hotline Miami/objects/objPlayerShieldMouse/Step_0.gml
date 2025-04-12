if global.xbox=1 {
scrXboxPlayerShieldMove()
scrXboxPlayerShieldMouse()
} else {
if !mouse_check_button(mb_right) reset=0
}
if sprite_index=sprShieldSnapUzi or sprite_index=sprShieldSnapMP5 or sprite_index=sprShieldSnapDoubleBarrel or sprite_index=sprShieldSnapSilencer or sprite_index=sprShieldSnapScorpion or sprite_index=sprShieldSnapMagnum {if image_index>=3 and snap=0 {snap=1 audio_play_sound(sndNeck,0,false)}}
global.test=0
objEffector.action=global.test

if keyboard_check(ord(global.upkey)) event_perform(ev_keyboard,ord("W"))
if keyboard_check(ord(global.downkey)) event_perform(ev_keyboard,ord("S"))
if keyboard_check(ord(global.leftkey)) event_perform(ev_keyboard,ord("A"))
if keyboard_check(ord(global.rightkey)) event_perform(ev_keyboard,ord("D"))

if global.xbox=1 aim=checkbutton(0,getid(9)) else aim=keyboard_check(vk_shift)
if aim {
/*viewspeed=point_distance(view_xview[0]+view_wview[0]/2,view_yview[0]+view_hview[0]/2,x+lengthdir_x(96,dir),y+lengthdir_y(96,dir))*0.1
viewdir=point_direction(view_xview[0]+view_wview[0]/2,view_yview[0]+view_hview[0]/2,x+lengthdir_x(96,dir),y+lengthdir_y(96,dir))
view_xview[0]+=lengthdir_x(viewspeed,viewdir)
view_yview[0]+=lengthdir_y(viewspeed,viewdir)*/
if global.xbox=1 {
viewx=objPlayer.x+rightthumb_x(0)*0.0045
viewy=objPlayer.y-rightthumb_y(0)*0.003
} else {
viewx=objPlayer.x+((display_mouse_get_x()-display_get_width()*0.5)*(__view_get( e__VW.WView, 0 )/display_get_width()))
viewy=objPlayer.y+((display_mouse_get_y()-display_get_height()*0.5)*(__view_get( e__VW.HView, 0 )/display_get_height()))
}
viewspeed=point_distance(camera_get_view_x(view_camera[0])+__view_get( e__VW.WView, 0 )/2,camera_get_view_y(view_camera[0])+__view_get( e__VW.HView, 0 )/2,viewx,viewy)*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+__view_get( e__VW.WView, 0 )/2,camera_get_view_y(view_camera[0])+__view_get( e__VW.HView, 0 )/2,viewx,viewy)
__view_set( e__VW.XView, 0, camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)) )
__view_set( e__VW.YView, 0, camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)) )
vdist=point_distance(x,y,room_width/2,room_height/2)
vdir=point_direction(room_width/2,room_height/2,x,y)
__view_set( e__VW.Angle, 0, lengthdir_y(vdist*(1/160),vdir*2) )
} else {
vdist=point_distance(x,y,room_width/2,room_height/2)
vdir=point_direction(room_width/2,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+__view_get( e__VW.WView, 0 )/2,camera_get_view_y(view_camera[0])+__view_get( e__VW.HView, 0 )/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+__view_get( e__VW.WView, 0 )/2,camera_get_view_y(view_camera[0])+__view_get( e__VW.HView, 0 )/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
__view_set( e__VW.XView, 0, camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)) )
__view_set( e__VW.YView, 0, camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)) )
__view_set( e__VW.Angle, 0, lengthdir_y(vdist*(1/160),vdir*2) )
}

xview=camera_get_view_x(view_camera[0])
yview=camera_get_view_y(view_camera[0])
if persistent=1 and objEffector.fade=1 {
if place_free(x+addx,y) x+=addx
if place_free(x,y+addy) y+=addy
if image_speed=0 image_index+=0.15
legindex+=0.4
exit 
}

/* */
/*  */
