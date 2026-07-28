if reload>0 or sprite_index=sprPLeaveBag or sprite_index=sprPTakePhone nothing=1 else {
lastweapon=scrCurrentWeapon()
lastammo=ammo

global.executionx=x
global.executiony=y

scrThroatEnemy()
if global.test=3 nothing=1 else {
global.exposed=0
release=0
with objKnockedOut {image_xscale=3 image_yscale=3}
if ammo>0 {
if sprite_index=sprPWalkScorpion or sprite_index=sprPWalkMP5 or sprite_index=sprPWalkMagnum or sprite_index=sprPWalkDoubleBarrel or sprite_index=sprPWalkUzi or sprite_index=sprPWalkSilencer {
if place_meeting(x,y,objKnockedOut) {
//remove from here
if global.controller=0 my_id=instance_create(x,y,objPlayerShieldMouse) else my_id=instance_create(x,y,objPlayerShieldController)
my_id.dir=dir
my_id.ammo=ammo
if sprite_index=sprPWalkScorpion my_id.sprite_index=sprPHumanShieldScorpion
if sprite_index=sprPWalkMagnum my_id.sprite_index=sprPHumanShieldMagnum
if sprite_index=sprPWalkDoubleBarrel my_id.sprite_index=sprPHumanShieldDoubleBarrel
if sprite_index=sprPWalkSilencer my_id.sprite_index=sprPHumanShieldSilencer
if sprite_index=sprPWalkMP5 my_id.sprite_index=sprPHumanShieldMP5
if sprite_index=sprPWalkUzi my_id.sprite_index=sprPHumanShieldUzi
global.test=0
with objKnockedOut {
if global.test=0 {
if place_meeting(x,y,objPlayer) {
if sprite_index=sprPoliceGetUp global.test=2 else {
global.test=1
instance_destroy()
}
}
}
}
if global.test=2 {with my_id instance_destroy()} else instance_destroy()
with objKnockedOut {image_xscale=1 image_yscale=1}
//to here and enable in step event!
quit=1
}
}
}

global.test=0
global.drop=1


if quit=0 {
if place_meeting(x,y,objKnockedOut) and global.exposed=0 {
with objKnockedOut {
image_xscale=3
image_yscale=3
if place_meeting(x,y,objPlayer) and global.test=0  {
global.test=2
if sprite_index=sprEGetUp or sprite_index=sprPoliceGetUp my_id=instance_create(x,y,scrGetKill(objPlayer.sprite_index))
if sprite_index=sprEGetUpLean {my_id=instance_create(x,y,objEnemyHeadKick) if objPlayer.sprite_index=sprPWalkBag or objPlayer.sprite_index=sprPAttackBag my_id.bag=1 else my_id.bag=0 global.test=1}
if my_id.object_index=objPBluntKill {
if objPlayer.sprite_index=sprPWalkCrowbar or objPlayer.sprite_index=sprPAttackCrowbar my_id.sprite_index=sprPKillCrowbar
if objPlayer.sprite_index=sprPWalkBat or objPlayer.sprite_index=sprPAttackBat my_id.sprite_index=sprPBatKill
if objPlayer.sprite_index=sprPWalkPipe or objPlayer.sprite_index=sprPAttackPipe my_id.sprite_index=sprPPipeKill
if objPlayer.sprite_index=sprPWalkClub or objPlayer.sprite_index=sprPAttackClub my_id.sprite_index=sprPClubKill
if objPlayer.sprite_index=sprPWalkBag or objPlayer.sprite_index=sprPAttackBag my_id.sprite_index=sprPBagKill
if objPlayer.sprite_index=sprPWalkPot or objPlayer.sprite_index=sprPAttackPot my_id.sprite_index=sprPKillPot
if objPlayer.sprite_index=sprPWalkPan or objPlayer.sprite_index=sprPAttackPan my_id.sprite_index=sprPKillPan
if objPlayer.sprite_index=sprPWalkNightStick or objPlayer.sprite_index=sprPAttackNightStick {
my_id1=instance_create(x+lengthdir_x(22,image_angle),y+lengthdir_x(22,image_angle),objPoliceHat)
my_id1.direction=image_angle-10+random(20)
my_id1.speed=1+random(2)
my_id.bottom=sprPoliceBluntKill 
my_id.sprite_index=sprPNightStickKill
}
}
if my_id.object_index=objEnemyBash and sprite_index=sprPoliceGetUp {
my_id1=instance_create(x+lengthdir_x(22,image_angle),y+lengthdir_x(22,image_angle),objPoliceHat)
my_id1.direction=image_angle-10+random(20)
my_id1.speed=1+random(2)
my_id.sprite_index=sprPAttackBashPolice
my_id.maskindex=global.maskindex
}


my_id.maskon=global.maskon
my_id.image_angle=angle
instance_destroy()
}
image_xscale=1
image_yscale=1
}
with objKnockedOut {
image_xscale=1
image_yscale=1
}
if global.test=1 {
if sprite_index=sprPWalkUnarmed or sprite_index=sprPWalkBag or sprite_index=sprPAttackBag nothing=1 else {
my_id=instance_create(objPlayer.x+lengthdir_x(8,objPlayer.dir+90),objPlayer.y+lengthdir_y(8,objPlayer.dir+90),objWeaponThrow)
my_id.image_index=lastweapon
my_id.direction=dir+70+random(40)
my_id.speed=1+random(2)
my_id.ammo=lastammo
}
instance_destroy()
quit=1
}
}

if quit=0 {
if global.test=2 {
with objKnockedOut {
image_xscale=1
image_yscale=1
}
instance_destroy() 
quit=1
}
}

}

with objKnockedOut {
image_xscale=1
image_yscale=1
}
}
}
