/*
argument5 in Shoot is if the weapon goes through an enemy.
*/

if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) or place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objDoorV) {
my_id=instance_create(x,y,objSmokeHit)
my_id.image_angle=image_angle
global.dir=dir
with my_id {
move_contact_solid(global.dir,16)
}
} else {
my_id=instance_create(x+lengthdir_x(16,dir-7),y+lengthdir_y(16,dir-7),argument0)
if instance_exists(my_id) {
my_id.direction=dir-3+random(6)
my_id.speed=16
my_id.image_angle=my_id.direction
if argument1=true{my_id.caliber=1}
}
}
