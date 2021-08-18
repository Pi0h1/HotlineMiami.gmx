PlaySFX(sndShotgun)
scrHearPlayer()
ammo-=1
reload=30
global.shake=5
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
repeat (8) {
my_id=instance_create(x+lengthdir_x(16,dir-7),y+lengthdir_y(16,dir-7),objBullet)
if instance_exists(my_id) {
my_id.direction=dir-6+random(12)
my_id.speed=16-random(4)
my_id.image_angle=my_id.direction
}
}
}
my_id=instance_create(x+lengthdir_x(5,dir-5*left),y+lengthdir_y(5,dir-5*left),objShell)
my_id.sprite_index=sprShotgunShell
my_id.image_angle=dir
my_id.direction=dir-90*left-20+random(30)
my_id.speed=1+random(3)
sprite_index=sprPAttackShotgun
image_speed=0.5
image_index=0
light=20
