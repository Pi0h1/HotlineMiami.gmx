release=0
if reload>0 exit
if objPlayer.sprite_index=sprPWalkBag or sprite_index=sprPWalkBossgun or objPlayer.sprite_index=sprPLeaveBag or sprite_index=sprPTakePhone exit
lastweapon=scrCurrentWeapon()
lastammo=ammo
global.exposed=0
release=0


if sprite_index=sprPWalkUnarmed nothing=1 else {
my_id=instance_create(objPlayer.x+lengthdir_x(8,objPlayer.dir+90),objPlayer.y+lengthdir_y(8,objPlayer.dir+90),objWeaponThrow)
my_id.image_index=lastweapon
my_id.direction=dir+70+random(40)
my_id.speed=1+random(2)
my_id.ammo=lastammo
sprite_index=sprPWalkUnarmed
mouse_clear(mb_right)
}




global.test=0
with objWeapon {
if global.test=0 {
if point_distance(x,y,objPlayer.x,objPlayer.y)<32 {
if ammo>0 {
global.etest=0
with objEnemy {if sprite_index=sprEWalkUnarmed or sprite_index=sprEGiveUp nothing=1 else {if alert=1 global.etest=1}}
if global.etest=1 {
my_id=instance_create(x,y-12,objScore)
my_id.text="+"+string(60*global.factor)+"pts"
global.myscore+=60*global.factor
ds_list_add(global.bonuslist,"Dangerous Pickup")
}
}
scrGetWeapon()
mouse_clear(mb_right)
objPlayer.ammo=ammo
audio_play_sound(sndPickupWeapon,0,false)
instance_destroy()
global.test=1
}
}
}
