PlaySFX(sndDoubleBarrel)
scrHearPlayer()
ammo-=1
reload=8
global.shake=7
if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) or place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objDoorV) {
my_id=instance_create(x,y,objSmokeHit)
my_id.image_angle=image_angle
global.dir=dir
with my_id {
move_contact_solid(global.dir,16)
}



with objDoorV {
if place_meeting(x+lengthdir_x(12,global.dir-180),y+lengthdir_y(12,global.dir-180),objPlayer) {

if object_index=objDoorV {
if solid=0 {
if abs(swingspeed)<8 {
swingspeed+=lengthdir_x(16,global.dir)
if abs(swingspeed)>3.5 swinger=1
}
if abs(swingspeed)>8 {swingspeed=sign(swingspeed)*8}
}
}

if object_index=objDoorH {
if solid=0 {
if abs(swingspeed)<8 {
swingspeed+=lengthdir_y(16,global.dir)
if abs(swingspeed)>3.5 swinger=1
}
if abs(swingspeed)>8 {swingspeed=sign(swingspeed)*8}
}
}

if object_index=objDoorV2 {
if solid=0 {
if abs(swingspeed)<8 {
swingspeed-=lengthdir_x(16,global.dir)
if abs(swingspeed)>3.5 swinger=1
}
if abs(swingspeed)>8 {swingspeed=sign(swingspeed)*8}
}
}

if object_index=objDoorH2 {
if solid=0 {
if abs(swingspeed)<8 {
swingspeed-=lengthdir_y(16,global.dir)
if abs(swingspeed)>3.5 swinger=1
}
if abs(swingspeed)>8 {swingspeed=sign(swingspeed)*8}
}
}


}
}

} else {
repeat (16) {
my_id=instance_create(x+lengthdir_x(16,dir-7-3),y+lengthdir_y(16,dir-7-3),objBullet)
if instance_exists(my_id) {
my_id.direction=dir-10+random(20)
my_id.speed=(16-random(6))*delta
my_id.image_angle=my_id.direction
}
}
}
if ammo=1 sprite_index=sprPAttackDoubleBarrel1 else sprite_index=sprPAttackDoubleBarrel2
image_speed=0.5
image_index=0
light=25
global.usedgun[2]=1

CreateShell(sprShotgunShell)
