if spawned=1 exit
visible=0
if x<room_width/2 {
visible=global.done
if visible and spawned=0 {
spawned=1
global.done=0
with objSubwayDoor {
visible=1
alarm[0]=90
}
alarm[0]=40

with objPlayer {
vdist=point_distance(x,y,room_width/2,room_height/2)
vdir=point_direction(room_width/2,room_height/2,x,y)
__view_set( e__VW.XView, 0, x+lengthdir_x(vdist*0.2,vdir-180)-__view_get( e__VW.WView, 0 )*0.5 )
__view_set( e__VW.YView, 0, y+lengthdir_y(vdist*0.2,vdir-180)-__view_get( e__VW.HView, 0 )*0.5 )
__view_set( e__VW.Angle, 0, lengthdir_y(vdist*(1/160),vdir*2) )
}
test=objPlayer.persistent
objPlayer.persistent=0
global.loaded=1
scrSaveGame()
//if !instance_exists(objMaskMenu) instance_create(x,y,objCheckpoint)
global.loaded=0
objPlayer.persistent=test

}
}
