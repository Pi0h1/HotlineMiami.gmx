if instance_exists(objEnemy) clear=0 else clear=1
if room=rmTutorial clear=1
if global.paused=1 { exit}
if !instance_exists(objEffector) instance_create(x,y,objEffector)
if !instance_exists(objBackgroundColor) instance_create(x,y,objBackgroundColor)
if !instance_exists(objSurfacer) instance_create(x,y,objSurfacer)
if persistent=1 {
/*if instance_exists(objElevator) {
vdist=point_distance(x,y,room_width/2,room_height/2)
vdir=point_direction(room_width/2,room_height/2,x,y)
view_xview[0]=x+lengthdir_x(vdist*0.2,vdir-180)-view_wview[0]*0.5
view_yview[0]=y+lengthdir_y(vdist*0.2,vdir-180)-view_hview[0]*0.5
view_angle[0]=lengthdir_y(vdist*(1/160),vdir*2)
} else {*/
__view_set( e__VW.XView, 0, xview )
__view_set( e__VW.YView, 0, yview )
with objEffector {
vlastx=camera_get_view_x(view_camera[0])
vlasty=camera_get_view_y(view_camera[0])
}
//}
alarm[0]=36

}
else {
vdist=point_distance(x,y,room_width/2,room_height/2)
vdir=point_direction(room_width/2,room_height/2,x,y)
__view_set( e__VW.XView, 0, x+lengthdir_x(vdist*0.2,vdir-180)-__view_get( e__VW.WView, 0 )*0.5 )
__view_set( e__VW.YView, 0, y+lengthdir_y(vdist*0.2,vdir-180)-__view_get( e__VW.HView, 0 )*0.5 )
__view_set( e__VW.Angle, 0, lengthdir_y(vdist*(1/160),vdir*2) )
with objEffector {
vlastx=camera_get_view_x(view_camera[0])
vlasty=camera_get_view_y(view_camera[0])
}
/*
viewx=objPlayer.x+(display_mouse_get_x()-display_get_width()*0.5)*(view_wview[0]/display_get_width())-view_wview[0]/2
viewy=objPlayer.y+(display_mouse_get_y()-display_get_height()*0.5)*(view_hview[0]/display_get_height())-view_hview[0]/2
view_xview[0]=viewx
view_yview[0]=viewy*/
}
/* */
/*  */
