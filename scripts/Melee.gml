if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) or place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objDoorV) {

if argument2=CbarHit1 or argument2=CbarHit2 {scrHearPlayer()}
PlaySFX(argument2)
my_id=instance_create(x,y,objSmokeHit)
my_id.image_angle=image_angle
global.dir=dir
with my_id {
move_contact_solid(global.dir,16)
}

repeat (2) {
my_id1=instance_create(x,y,objDebris)
my_id1.direction=random(360)
my_id1.speed=random(2)
}
}

PlaySFX(choose(sndSwing1,sndSwing2))
sprite_index    =   asset_get_index(string_replace(sprite_get_name(sprite_index),"Walk","Attack"))
image_index     =   1
image_speed     =   argument0
reload          =   argument1
