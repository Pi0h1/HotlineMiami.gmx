if gettrigger_l()>100 {
if ltrig=0 {
ltrig=1
if reload<=0 {
lastweapon=scrCurrentWeapon()
global.test=0
global.exposed=0
global.drop=1
with objEnemy {if scrCollisionLineExt(x,y,objPlayer.x,objPlayer.y,4,objSolid,objDoorV,objWallSoftH)=0 global.exposed=1}
lastweapon=scrCurrentWeapon()
lastammo=ammo
if place_meeting(x,y,objKnockedOut) and global.exposed=0 {
with objKnockedOut {
if place_meeting(x,y,objPlayer) and global.test=0  {
my_id=instance_create(x,y,objEnemyBash)
my_id.image_angle=angle
instance_destroy()
global.test=1
}
}
if global.test=1 {
if sprite_index=sprPWalkUnarmed nothing=1 else {
my_id=instance_create(objPlayer.x+lengthdir_x(8,objPlayer.dir+90),objPlayer.y+lengthdir_y(8,objPlayer.dir+90),objWeaponThrow)
my_id.image_index=lastweapon
my_id.direction=dir+70+random(40)
my_id.speed=1+random(2)
my_id.ammo=lastammo
}
instance_destroy()
exit
}
}



global.test=0
if sprite_index=sprPWalkUnarmed noweapon=1 else noweapon=0
with objWeapon {
if global.test=0 {
if point_distance(x,y,objPlayer.x,objPlayer.y)<32 {
if ammo>0 {
global.etest=0
with objEnemy {if sprite_index=sprEWalkUnarmed nothing=1 else {if alert=1 global.etest=1}}
if global.etest=1 {
my_id=instance_create(x,y-12,objScore)
my_id.text="+"+string(60*global.factor)+"pts"
global.myscore+=60*global.factor
}
}

if objPlayer.sprite_index=sprPWalkUnarmed nothing=1 else {
if objPlayer.throwreload=0 {
if global.exposed=1 {
objPlayer.throwreload=80
global.test=2
}
}
}

scrGetWeapon()
global.drop=0
objPlayer.ammo=ammo
audio_play_sound(sndPickupWeapon,0,false)
instance_destroy()
if global.test=0 global.test=1
}
}
}


if lastweapon>=12 and global.test=0 global.test=1

if sprite_index=sprPWalkUnarmed exit
switch global.test {
case 0:
my_id=instance_create(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objWeaponThrow)
audio_play_sound(sndThrow,0,false)
my_id.speed=8
my_id.direction=dir-5+random(10)
my_id.ammo=lastammo
my_id.image_index=scrCurrentWeapon()
sprite_index=sprPWalkUnarmed
break;
case 1:
if noweapon=0 {
my_id=instance_create(objPlayer.x+lengthdir_x(8,objPlayer.dir-90),objPlayer.y+lengthdir_y(8,objPlayer.dir-90),objWeaponThrow)
my_id.image_index=lastweapon
my_id.direction=dir-70-random(40)
my_id.speed=1+random(2)
my_id.ammo=lastammo
if global.drop=1 sprite_index=sprPWalkUnarmed
}
break;
case 2:
if noweapon=0 {
if lastweapon>=10 my_id=instance_create(x+lengthdir_x(14,dir+left*-20),y+lengthdir_y(12,dir+left*-20),objThrowingWeapon) else my_id=instance_create(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objWeaponThrow)
audio_play_sound(sndThrow,0,false)
my_id.speed=8
my_id.direction=dir-5+random(10)
my_id.ammo=lastammo
my_id.image_index=lastweapon
}
break;
}
}
}
} else ltrig=0
