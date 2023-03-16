if sprite_index=sprPWalkBag or sprite_index=sprPAttackBag nothing=1 else {
global.test=0
if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objEnemy) {
with objEnemy {
if object_index=objDogPatrol or object_index=objEnemyFat or scrIsPolice(object_index) or global.test>0 nothing=1 else {
if place_meeting(x-lengthdir_x(12,objPlayer.dir),y-lengthdir_y(12,objPlayer.dir),objPlayer) {
my_id=instance_create(objPlayer.x+lengthdir_x(7,objPlayer.dir),objPlayer.y+lengthdir_y(7,objPlayer.dir),objPAttackThroat)
//my_id=instance_create(objPlayer.x+lengthdir_x(7,objPlayer.dir),(y+objPlayer.y)*0.5,objPAttackThroat)
my_id.maskindex=objPlayer.maskindex
my_id.maskon=1
my_id.image_angle=objPlayer.dir
//my_id.image_angle=point_direction(objPlayer.x,objPlayer.y,x,y)
instance_destroy()
audio_play_sound(sndThrow,0,false)
audio_play_sound(sndHitWall,0,false)
global.test=1
if sprite_index=sprEWalkUnarmed or sprite_index=sprEGiveUp or global.maskindex=11 noweapon=1 else noweapon=0
if noweapon=0 {
my_id=instance_create(x,y,objWeaponThrow)
my_id.direction=direction-115+random(50)
my_id.speed=2+random(1)
my_id.image_index=scrCurrentWeaponExt(sprite_index)
my_id.ammo=ammo
}
if global.maskindex=11 {if scrCurrentWeaponExt(sprite_index)>0 global.gun=scrIndexToWeapon(scrCurrentWeaponExt(sprite_index)) else global.gun=sprPWalkUnarmed}
}
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
global.test=3
instance_destroy()
exit
}
}
}
