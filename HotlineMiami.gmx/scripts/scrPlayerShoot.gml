if  objPlayer.sprite_index=sprPLeaveBag or sprite_index=sprPWalkBossgun or objPlayer.sprite_index=sprPMaskSlip or instance_exists(objMaskMenu) nothing=1 else {
sprite=mask_index

if reload<=0 {
if sprite_index=sprPWalkUnarmed {
audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
sprite_index=sprPAttackPunch
image_index=0
image_speed=0.5
reload=20

}

if sprite_index=sprPWalkBag {
audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
sprite_index=sprPAttackBag
image_index=1
image_speed=0.5
reload=20
}

if sprite_index=sprPWalkPan {
audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
sprite_index=sprPAttackPan
image_index=1
image_speed=0.5
reload=20
global.usedmelee[12]=1
}

if sprite_index=sprPWalkCrowbar {
audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
sprite_index=sprPAttackCrowbar
image_index=1
image_speed=0.5
reload=20
global.usedmelee[9]=1
}

if sprite_index=sprPWalkMachete {
audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
sprite_index=sprPAttackMachete
image_index=1
image_speed=0.5
reload=12
global.usedmelee[10]=1
}

if sprite_index=sprPWalkPot {
audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
sprite_index=sprPAttackPot
image_index=1
image_speed=0.5
reload=25
global.usedmelee[13]=1
}

if sprite_index=sprPWalkBoilingPot {
audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
sprite_index=sprPAttackBoilingPot
image_index=1
image_speed=0.5
repeat (3+random(2)) {
my_id=instance_create(x+lengthdir_x(11,dir)-2+random(4),y+lengthdir_y(11,dir)-2+random(4),objPWater)
global.mydir=dir
with my_id move_contact_solid(global.mydir,10)
my_id.direction=point_direction(x,y,my_id.x,my_id.y)
my_id.speed=8
my_id.image_angle=my_id.direction
}
reload=25
global.usedmelee[13]=1
}

if sprite_index=sprPigButcher {
audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
sprite_index=sprPigButcherAttack
image_index=0
image_speed=0.5
reload=20
}

if sprite_index=sprPWalkDrill {
audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
sprite_index=sprPAttackDrill
image_index=1
image_speed=0.5
reload=20
}

if sprite_index=sprPWalkTrophy {
audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
sprite_index=sprPAttackTrophy
image_index=0
image_speed=0.5
reload=20
}

if ammo>0 {

mask_index=sprBullet
image_angle=dir
if sprite_index=sprPWalkM16 {
audio_play_sound(sndM16,0,false)
scrHearPlayer()
ammo-=1
reload=2
global.shake=3
if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) or place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objDoorV) {
my_id=instance_create(x,y,objSmokeHit)
my_id.image_angle=image_angle
global.dir=dir
with my_id {
move_contact_solid(global.dir,16)
}
} else {
my_id=instance_create(x+lengthdir_x(16,dir-7),y+lengthdir_y(16,dir-7),objBullet)
if instance_exists(my_id) {
my_id.direction=dir-3+random(6)
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
global.usedgun[0]=1
}

if sprite_index=sprPWalkShotgun {
audio_play_sound(sndShotgun,0,false)
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
global.usedgun[1]=1
}

if sprite_index=sprPWalkDoubleBarrel {
audio_play_sound(sndDoubleBarrel,0,false)
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
my_id.speed=16-random(6)
my_id.image_angle=my_id.direction
}
}
}
if ammo=1 sprite_index=sprPAttackDoubleBarrel1 else sprite_index=sprPAttackDoubleBarrel2
image_speed=0.5
image_index=0
light=25
global.usedgun[2]=1
}


if sprite_index=sprPWalkSilencer {
audio_play_sound(sndSilencer,0,false)
ammo-=1
reload=10
global.shake=2
if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) or place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objDoorV) {
my_id=instance_create(x,y,objSmokeHit)
my_id.image_angle=image_angle
global.dir=dir
with my_id {
move_contact_solid(global.dir,16)
}
} else {
my_id=instance_create(x+lengthdir_x(20,dir-7),y+lengthdir_y(20,dir-7),objBullet)
if instance_exists(my_id) {
my_id.direction=dir-3+random(6)
my_id.speed=16
my_id.image_angle=my_id.direction
}
}
my_id=instance_create(x+lengthdir_x(16,dir-7-4*left),y+lengthdir_y(16,dir-7-4*left),objShell)
my_id.sprite_index=sprUziShell
my_id.image_angle=dir
my_id.direction=dir-90*left-20+random(30)
my_id.speed=1+random(3)
sprite_index=sprPAttackSilencer
image_speed=0.5
image_index=0
light=12
global.usedgun[3]=1
}


if sprite_index=sprPWalkUzi {
audio_play_sound(sndUzi,0,false)
scrHearPlayer()
ammo-=1
reload=1
global.shake=3
if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) or place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objDoorV) {
my_id=instance_create(x,y,objSmokeHit)
my_id.image_angle=image_angle
global.dir=dir
with my_id {
move_contact_solid(global.dir,16)
}
} else {
my_id=instance_create(x+lengthdir_x(20,dir-7),y+lengthdir_y(20,dir-7),objBullet)
if instance_exists(my_id) {
my_id.direction=dir-5+random(10)
my_id.speed=16
my_id.image_angle=my_id.direction
}
}
my_id=instance_create(x+lengthdir_x(16,dir-7-4*left),y+lengthdir_y(16,dir-7-4*left),objShell)
my_id.sprite_index=sprUziShell
my_id.image_angle=dir
my_id.direction=dir-90*left-20+random(30)
my_id.speed=1+random(3)
sprite_index=sprPAttackUzi
image_speed=1
image_index=0
light=12
global.usedgun[4]=1
}

if sprite_index=sprPWalkSilencedUzi {
audio_play_sound(sndSilencer,0,false)
ammo-=1
reload=2
global.shake=3
if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) or place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objDoorV) {
my_id=instance_create(x,y,objSmokeHit)
my_id.image_angle=image_angle
global.dir=dir
with my_id {
move_contact_solid(global.dir,16)
}
} else {
my_id=instance_create(x+lengthdir_x(20,dir-7),y+lengthdir_y(20,dir-7),objBullet)
if instance_exists(my_id) {
my_id.direction=dir-5+random(10)
my_id.speed=16
my_id.image_angle=my_id.direction
}
}
my_id=instance_create(x+lengthdir_x(16,dir-7-4*left),y+lengthdir_y(16,dir-7-4*left),objShell)
my_id.sprite_index=sprUziShell
my_id.image_angle=dir
my_id.direction=dir-90*left-20+random(30)
my_id.speed=1+random(3)
sprite_index=sprPAttackSilencedUzi
image_speed=1
image_index=0
light=12
global.usedgun[8]=1
}

if sprite_index=sprPWalkMP5 {
audio_play_sound(sndMP5,0,false)
scrHearPlayer()
ammo-=1
reload=2
global.shake=3
if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) or place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objDoorV) {
my_id=instance_create(x,y,objSmokeHit)
my_id.image_angle=image_angle
global.dir=dir
with my_id {
move_contact_solid(global.dir,16)
}
} else {
my_id=instance_create(x+lengthdir_x(20,dir-7),y+lengthdir_y(20,dir-7),objBullet)
if instance_exists(my_id) {
my_id.direction=dir-5+random(10)
my_id.speed=16
my_id.image_angle=my_id.direction
}
}
my_id=instance_create(x+lengthdir_x(16,dir-7-4*left),y+lengthdir_y(16,dir-7-4*left),objShell)
my_id.sprite_index=sprUziShell
my_id.image_angle=dir
my_id.direction=dir-90*left-20+random(30)
my_id.speed=1+random(3)
sprite_index=sprPAttackMP5
image_speed=1
image_index=0
light=12
global.usedgun[7]=1
}

if sprite_index=sprPigButcherWalkMP5 {image_index=0 sprite_index=sprPigButcherShoot}
if sprite_index=sprPigButcherShoot {
if image_index<2 image_index+=0.25 else {
image_index=2
audio_play_sound(sndMP5,0,false)
//scrHearPlayer()
ammo-=1
reload=2
global.shake=3
if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) or place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objDoorV) {
my_id=instance_create(x,y,objSmokeHit)
my_id.image_angle=image_angle
global.dir=dir
with my_id {
move_contact_solid(global.dir,16)
}
} else {
my_id=instance_create(x+lengthdir_x(20,dir-18),y+lengthdir_y(20,dir-18),objBullet)
if instance_exists(my_id) {
my_id.direction=dir-5+random(10)
my_id.speed=16
my_id.image_angle=my_id.direction
}
}
my_id=instance_create(x+lengthdir_x(16,dir-7-4*left),y+lengthdir_y(16,dir-7-4*left),objShell)
my_id.sprite_index=sprUziShell
my_id.image_angle=dir
my_id.direction=dir-90*left-20+random(30)
my_id.speed=1+random(3)
image_speed=0
light=12
}
}

if sprite_index=sprPWalkMagnum {
audio_play_sound(sndMagnum,0,false)
scrHearPlayer()
ammo-=1
reload=8
global.shake=4
if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) or place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objDoorV) {
my_id=instance_create(x,y,objSmokeHit)
my_id.image_angle=image_angle
global.dir=dir
with my_id {
move_contact_solid(global.dir,16)
}
} else {
my_id=instance_create(x+lengthdir_x(20,dir-7),y+lengthdir_y(20,dir-7),objBullet)
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
global.usedgun[5]=1
}

if sprite_index=sprPWalkScorpion {
audio_play_sound(sndScorpion,0,false)
scrHearPlayer()
ammo-=1
reload=2
global.shake=3
if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) or place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objDoorV) {
my_id=instance_create(x,y,objSmokeHit)
my_id.image_angle=image_angle
global.dir=dir
with my_id {
move_contact_solid(global.dir,16)
}
} else {
my_id=instance_create(x+lengthdir_x(20,dir-7),y+lengthdir_y(20,dir-7),objBullet)
if instance_exists(my_id) {
my_id.direction=dir-3+random(6)
my_id.speed=16
my_id.image_angle=my_id.direction
}
}
my_id=instance_create(x+lengthdir_x(16,dir-7-4*left),y+lengthdir_y(16,dir-7-4*left),objShell)
my_id.sprite_index=sprUziShell
my_id.image_angle=dir
my_id.direction=dir-90*left-20+random(30)
my_id.speed=1+random(3)
sprite_index=sprPAttackScorpion
image_speed=1
image_index=0
light=12
global.usedgun[6]=1
}
scrCheckUsedGuns()
}




if sprite_index=sprPWalkThrow {
my_id=instance_create(x+lengthdir_x(14,dir+left*-35),y+lengthdir_y(12,dir+left*-35),objThrowingWeapon)
audio_play_sound(sndThrow,0,false)
my_id.speed=12
my_id.direction=dir-2+random(4)
my_id.image_index=throwindex
global.usedthrow[throwindex]=1
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
global.usedmelee[4]=1
}


if sprite_index=sprPWalkKnife {
audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
sprite_index=sprPAttackKnife
image_speed=1
image_index=0
reload=10
global.usedmelee[3]=1
}



if sprite_index=sprPWalkClub {
audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
sprite_index=sprPAttackClub
image_speed=0.7
image_index=1
reload=19
global.usedmelee[0]=1
}

if sprite_index=sprPWalkNightStick {
audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
sprite_index=sprPAttackNightStick
image_speed=0.7
image_index=1
reload=15
global.usedmelee[8]=1
}

if sprite_index=sprPWalkPipe {
audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
sprite_index=sprPAttackPipe
image_speed=0.7
image_index=1
reload=22
global.usedmelee[1]=1
}

if sprite_index=sprPWalkBat {
audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
sprite_index=sprPAttackBat
image_speed=0.7
image_index=1
reload=25
global.usedmelee[2]=1
}

if sprite_index=sprPWalkAxe {
audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
sprite_index=sprPAttackAxe
image_speed=0.35
image_index=1
reload=30
global.usedmelee[7]=1
}

if sprite_index=sprPWalkSledgeHammer {
audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
sprite_index=sprPAttackSledgeHammer
image_speed=0.35
image_index=1
reload=30
global.usedmelee[11]=1
}

if sprite_index=sprPWalkPool {
audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
sprite_index=sprPAttackPool
image_speed=0.7
image_index=1
reload=20
global.usedmelee[5]=1
}

if sprite_index=sprPWalkPoolBroke {
audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
sprite_index=sprPAttackPoolBroke
image_speed=0.7
image_index=1
reload=20
global.usedmelee[6]=1
}


mask_index=sprite
image_angle=0
}
}
scrCheckUsedGuns()
scrCheckUsedMelee()
scrCheckUsedThrows()
