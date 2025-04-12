if global.xbox=1 scrXboxHoboBash()
if global.controller=1 {
if gettrigger_r()>100 {
if rtrig=0 {
if image_index=3 {
rtrig=1
audio_play_sound(sndWeaponHit,0,false)
if energie>0 {
energie-=1
image_index=0
} else {
audio_play_sound(sndHit,0,false)
audio_play_sound(sndPunch,0,false)
myx=x+lengthdir_x(20,image_angle)
myy=y+lengthdir_y(24,image_angle)
my_id=instance_create(x,y-12,objScore)
my_id.text="+"+string((200)+400*(global.factor-1))+"pts"
global.myscore+=(200)+400*(global.factor-1)
my_id=instance_create(myx,myy,objBloodPool)
my_id=instance_create(x,y,objDeadBody)
my_id.sprite_index=sprEBackBashed
my_id.image_index=floor(random(4))
my_id.image_angle=image_angle
if global.controller=1 my_id=instance_create(x,y,objPlayerController) else my_id=instance_create(x,y,objPlayerMouse)
my_id.reload=30
instance_destroy()
}
}
}
} else rtrig=0
}

vdist=point_distance(x,y,room_width/2,room_height/2)
vdir=point_direction(room_width/2,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+__view_get( e__VW.WView, 0 )/2,camera_get_view_y(view_camera[0])+__view_get( e__VW.HView, 0 )/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+__view_get( e__VW.WView, 0 )/2,camera_get_view_y(view_camera[0])+__view_get( e__VW.HView, 0 )/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
__view_set( e__VW.XView, 0, camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)) )
__view_set( e__VW.YView, 0, camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)) )
__view_set( e__VW.Angle, 0, lengthdir_y(vdist*(1/160),vdir*2) )


if image_index<3 image_index+=0.25

