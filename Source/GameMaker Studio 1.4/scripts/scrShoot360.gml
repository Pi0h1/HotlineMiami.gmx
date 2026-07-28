if light>0 setrumble(0,65535,65535) else setrumble(0,0,0)
if gettrigger_r()>100 {
if reload<=0 {
if sprite_index=sprPWalkUnarmed {
audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
sprite_index=sprPAttackPunch
image_index=0
image_speed=0.5
reload=20
}

if ammo>0 {
sprite=mask_index
mask_index=sprBullet
image_angle=dir
if sprite_index=sprPWalkM16 {
audio_play_sound(sndM16,0,false)
scrHearPlayer()
ammo-=1
reload=3
if !place_free(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir)) {
my_id=instance_create(x,y,objSmokeHit)
my_id.image_angle=image_angle
global.dir=dir
with my_id {
move_contact_solid(global.dir,16)
}
} else {
my_id=instance_create(x+lengthdir_x(16,dir),y+lengthdir_y(16,dir),objBullet)
if instance_exists(my_id) {
my_id.direction=dir-1+random(2)
my_id.speed=16
my_id.image_angle=my_id.direction
}
}
my_id=instance_create(x+lengthdir_x(5,dir-5*left),y+lengthdir_y(5,dir-5*left),objShell)
my_id.sprite_index=sprM16Shell
my_id.image_angle=dir
my_id.direction=dir-90*left-20+random(30)
my_id.speed=1+random(3)
sprite_index=sprPAttackM16
image_speed=0.5
image_index=0
light=12
}

if sprite_index=sprPWalkShotgun {
audio_play_sound(sndShotgun,0,false)
scrHearPlayer()
ammo-=1
reload=30
if !place_free(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir)) {
my_id=instance_create(x,y,objSmokeHit)
my_id.image_angle=image_angle
global.dir=dir
with my_id {
move_contact_solid(global.dir,16)
}
} else {
repeat (8) {
my_id=instance_create(x+lengthdir_x(16,dir),y+lengthdir_y(16,dir),objBullet)
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
}

if sprite_index=sprPWalkDoubleBarrel {
audio_play_sound(sndDoubleBarrel,0,false)
scrHearPlayer()
ammo-=1
reload=8
if !place_free(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir)) {
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
if ammo=1 sprite_index=sprPAttackDoubleBarrel1 else sprite_index=sprPAttackDoubleBarrel2
image_speed=0.5
image_index=0
light=25
}


if sprite_index=sprPWalkSilencer {
audio_play_sound(sndSilencer,0,false)
ammo-=1
reload=10
if !place_free(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir)) {
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
sprite_index=sprPAttackSilencer
image_speed=0.5
image_index=0
light=12
}


if sprite_index=sprPWalkUzi {
audio_play_sound(sndUzi,0,false)
scrHearPlayer()
ammo-=1
reload=1
if !place_free(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir)) {
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
sprite_index=sprPAttackUzi
image_speed=1
image_index=0
light=12
}

if sprite_index=sprPWalkMagnum {
audio_play_sound(sndMagnum,0,false)
scrHearPlayer()
ammo-=1
reload=8
if !place_free(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir)) {
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
sprite_index=sprPAttackMagnum
image_speed=0.5
image_index=0
light=12
}

if sprite_index=sprPWalkScorpion {
audio_play_sound(sndScorpion,0,false)
scrHearPlayer()
ammo-=1
reload=2
if !place_free(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir)) {
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
sprite_index=sprPAttackScorpion
image_speed=1
image_index=0
light=12
}



}



if sprite_index=sprPWalkThrow {
my_id=instance_create(x+lengthdir_x(14,dir+left*-35),y+lengthdir_y(12,dir+left*-35),objThrowingWeapon)
audio_play_sound(sndThrow,0,false)
my_id.speed=12
my_id.direction=dir-2+random(4)
my_id.image_index=throwindex
reload=20
image_speed=0.5
image_index=1
sprite_index=sprPAttackThrow
left=1
}

if sprite_index=sprPWalkSword {
audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
sprite_index=sprPAttackSword
image_speed=1
image_index=0
reload=15
}



if sprite_index=sprPWalkKnife {
audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
sprite_index=sprPAttackKnife
image_speed=1
image_index=0
reload=10

}

if sprite_index=sprPWalkClub {
audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
sprite_index=sprPAttackClub
image_speed=0.7
image_index=1
reload=19

}

if sprite_index=sprPWalkPipe {
audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
sprite_index=sprPAttackPipe
image_speed=0.7
image_index=1
reload=22

}

if sprite_index=sprPWalkBat {
audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
sprite_index=sprPAttackBat
image_speed=0.7
image_index=1
reload=25

}
}


mask_index=sprite
image_angle=0
}
