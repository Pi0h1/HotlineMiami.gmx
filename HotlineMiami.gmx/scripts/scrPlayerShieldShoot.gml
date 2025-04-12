if sprite_index=sprShieldSnapUzi or sprite_index=sprShieldSnapMP5 or sprite_index=sprShieldSnapDoubleBarrel or sprite_index=sprShieldSnapSilencer or sprite_index=sprShieldSnapScorpion or sprite_index=sprShieldSnapMagnum exit
sprite=mask_index
if reload<=0 {

if ammo>0 {
mask_index=sprBullet
image_angle=dir

if sprite_index=sprPHumanShieldDoubleBarrel {
audio_play_sound(sndDoubleBarrel,0,false)
scrHearPlayer()
ammo-=1
reload=8
if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) {
my_id=instance_create(x,y,objSmokeHit)
my_id.image_angle=image_angle
global.dir=dir
with my_id {
move_contact_solid(global.dir,16)
}
} else {
repeat (16) {
my_id=instance_create(x+lengthdir_x(16,dir-3),y+lengthdir_y(16,dir-3),objBullet)
if instance_exists(my_id) {
my_id.direction=dir-10+random(20)
my_id.speed=16-random(6)
my_id.image_angle=my_id.direction
}
}
}
if ammo=1 sprite_index=sprPHumanShieldDoubleBarrelShoot1 else sprite_index=sprPHumanShieldDoubleBarrelShoot2
image_speed=0.5
image_index=0
light=25
}


if sprite_index=sprPHumanShieldSilencer {
audio_play_sound(sndSilencer,0,false)
ammo-=1
reload=10
if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) {
my_id=instance_create(x,y,objSmokeHit)
my_id.image_angle=image_angle
global.dir=dir
with my_id {
move_contact_solid(global.dir,16)
}
} else {
my_id=instance_create(x+lengthdir_x(20,dir),y+lengthdir_y(20,dir),objBullet)
if instance_exists(my_id) {
my_id.direction=dir-3+random(6)
my_id.speed=16
my_id.image_angle=my_id.direction
}
}
my_id=instance_create(x+lengthdir_x(16,dir-4*left),y+lengthdir_y(16,dir-4*left),objShell)
my_id.sprite_index=sprUziShell
my_id.image_angle=dir
my_id.direction=dir-90*left-20+random(30)
my_id.speed=1+random(3)
sprite_index=sprPHumanShieldSilencerShoot
image_speed=0.5
image_index=0
light=12
}


if sprite_index=sprPHumanShieldUzi {
audio_play_sound(sndUzi,0,false)
scrHearPlayer()
ammo-=1
reload=1
if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) {
my_id=instance_create(x,y,objSmokeHit)
my_id.image_angle=image_angle
global.dir=dir
with my_id {
move_contact_solid(global.dir,16)
}
} else {
my_id=instance_create(x+lengthdir_x(20,dir),y+lengthdir_y(20,dir),objBullet)
if instance_exists(my_id) {
my_id.direction=dir-5+random(10)
my_id.speed=16
my_id.image_angle=my_id.direction
}
}
my_id=instance_create(x+lengthdir_x(16,dir-4*left),y+lengthdir_y(16,dir-4*left),objShell)
my_id.sprite_index=sprUziShell
my_id.image_angle=dir
my_id.direction=dir-90*left-20+random(30)
my_id.speed=1+random(3)
sprite_index=sprPHumanShieldUziShoot
image_speed=1
image_index=0
light=12
}

if sprite_index=sprPHumanShieldMP5 {
audio_play_sound(sndMP5,0,false)
scrHearPlayer()
ammo-=1
reload=2
if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) {
my_id=instance_create(x,y,objSmokeHit)
my_id.image_angle=image_angle
global.dir=dir
with my_id {
move_contact_solid(global.dir,16)
}
} else {
my_id=instance_create(x+lengthdir_x(20,dir),y+lengthdir_y(20,dir),objBullet)
if instance_exists(my_id) {
my_id.direction=dir-5+random(10)
my_id.speed=16
my_id.image_angle=my_id.direction
}
}
my_id=instance_create(x+lengthdir_x(16,dir-4*left),y+lengthdir_y(16,dir-4*left),objShell)
my_id.sprite_index=sprUziShell
my_id.image_angle=dir
my_id.direction=dir-90*left-20+random(30)
my_id.speed=1+random(3)
sprite_index=sprPHumanShieldMP5Shoot
image_speed=1
image_index=0
light=12
}

if sprite_index=sprPHumanShieldMagnum {
audio_play_sound(sndMagnum,0,false)
scrHearPlayer()
ammo-=1
reload=8
if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) {
my_id=instance_create(x,y,objSmokeHit)
my_id.image_angle=image_angle
global.dir=dir
with my_id {
move_contact_solid(global.dir,16)
}
} else {
my_id=instance_create(x+lengthdir_x(20,dir),y+lengthdir_y(20,dir),objBullet)
if instance_exists(my_id) {
my_id.direction=dir
my_id.speed=16
my_id.image_angle=my_id.direction
my_id.caliber=1
}
}
sprite_index=sprPHumanShieldMagnumShoot
image_speed=0.5
image_index=0
light=12
}

if sprite_index=sprPHumanShieldScorpion {
audio_play_sound(sndScorpion,0,false)
scrHearPlayer()
ammo-=1
reload=2
if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) {
my_id=instance_create(x,y,objSmokeHit)
my_id.image_angle=image_angle
global.dir=dir
with my_id {
move_contact_solid(global.dir,16)
}
} else {
my_id=instance_create(x+lengthdir_x(20,dir),y+lengthdir_y(20,dir),objBullet)
if instance_exists(my_id) {
my_id.direction=dir-3+random(6)
my_id.speed=16
my_id.image_angle=my_id.direction
}
}
my_id=instance_create(x+lengthdir_x(16,dir-4*left),y+lengthdir_y(16,dir-4*left),objShell)
my_id.sprite_index=sprUziShell
my_id.image_angle=dir
my_id.direction=dir-90*left-20+random(30)
my_id.speed=1+random(3)
sprite_index=sprPHumanShieldScorpionShoot
image_speed=1
image_index=0
light=12
}

}
}


mask_index=sprite
image_angle=0
