if image_index<10.25 image_index+=0.25 else {
myx=x+lengthdir_x(7,image_angle)
myy=y+lengthdir_y(7,image_angle)
my_id=instance_create(x,y-12,objScore)
my_id.text="+"+string((kill)+bold*(global.factor))+"pts"
global.myscore+=(kill)+bold*(global.factor)
global.killscore+=kill
global.boldscore+=bold*global.factor
global.combotime=240
global.combo+=1
global.killx[global.kills]=x
global.killy[global.kills]=y
global.kills+=1
ds_list_add(global.bonuslist,"Execution")
if global.combotime<12 global.combotime=12
my_id=instance_create(myx,myy,objBloodPool)
my_id=instance_create(x,y,objDeadBody)
my_id.sprite_index=sprEBackHeadbutt
my_id.image_angle=image_angle
with my_id {
dir=image_angle+image_yscale*12
my_id=instance_create(x+lengthdir_x(19,dir),y+lengthdir_y(19,dir),objBloodSquirt)
my_id.image_angle=random(360)
}
global.angle=image_angle-180
if global.controller=1 my_id=instance_create(x,y,objPlayerController) else my_id=instance_create(x,y,objPlayerMouse)
my_id.reload=10
if global.maskindex=11 {my_id.sprite_index=global.gun with my_id {scrGetAmmo(sprite_index)}}
my_id.sprite_index=sprPigButcher
//with my_id move_outside_solid(global.angle,6)
instance_destroy()
}

if bled=0 and image_index>=9 {
sound_play(sndHit)
bled=1
myx=x+lengthdir_x(8,image_angle)
myy=y+lengthdir_y(8,image_angle)
repeat (8) {
dir=random(360)
my_id=instance_create(myx+lengthdir_x(5,dir),myy+lengthdir_y(5,dir),objBloodSmoke)
my_id.direction=dir
my_id.speed=2+random(1)
my_id.friction=0.1
}
}

vdist=point_distance(x,y,room_width/2,room_height/2)
vdir=point_direction(room_width/2,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+__view_get( e__VW.WView, 0 )/2,camera_get_view_y(view_camera[0])+__view_get( e__VW.HView, 0 )/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+__view_get( e__VW.WView, 0 )/2,camera_get_view_y(view_camera[0])+__view_get( e__VW.HView, 0 )/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
__view_set( e__VW.XView, 0, camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)) )
__view_set( e__VW.YView, 0, camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)) )
__view_set( e__VW.Angle, 0, lengthdir_y(vdist*(1/160),vdir*2) )

