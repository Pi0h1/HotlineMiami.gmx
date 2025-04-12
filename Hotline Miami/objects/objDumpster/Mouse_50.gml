if on=1 exit
global.test=0
if objPlayer.x<x+40 {
with objPlayer {
if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objDumpster) {sprite_index=sprPLeaveBag image_index=1 image_speed=0.5 global.test=1}
}
if global.test=0 exit
if on=0 {
xview=camera_get_view_x(view_camera[0])
yview=camera_get_view_y(view_camera[0])
angle=__view_get( e__VW.Angle, 0 )
with objPlayer {
vdist=point_distance(x,y,room_width/2,room_height/2)
vdir=point_direction(room_width/2,room_height/2,x,y)
__view_set( e__VW.XView, 0, x+lengthdir_x(vdist*0.2,vdir-180)-__view_get( e__VW.WView, 0 )*0.5 )
__view_set( e__VW.YView, 0, y+lengthdir_y(vdist*0.2,vdir-180)-__view_get( e__VW.HView, 0 )*0.5 )
__view_set( e__VW.Angle, 0, lengthdir_y(vdist*(1/160),vdir*2) )
}



on=1
my_id=instance_create(52,304,objHobo)
my_id.direction=260+random(20)
}
}
