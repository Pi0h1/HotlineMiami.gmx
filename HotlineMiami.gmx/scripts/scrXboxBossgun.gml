if gettrigger_l()>100 {
if pressltrig=0 {
pressltrig=1
if room=rmMansionBalcony exit
if objBossPhone.talked=0 exit
if place_meeting(x,y,objPlayer)  {
/*with objPlayer {
instance_destroy()
instance_create(x,y,objPlayerMouseHouse)
}*/
with objPlayer {
if sprite_index=sprPWalkUnarmed or sprite_index=sprPAttackPunch or sprite_index=sprPAttackBash noweapon=1 else noweapon=0
if noweapon=0 {
my_id=instance_create(x,y,objWeaponThrow)
my_id.direction=random(360)
my_id.speed=2+random(1)
my_id.image_index=scrCurrentWeaponExt(sprite_index)
my_id.ammo=ammo
}
}
objPlayer.sprite_index=sprPWalkBossgun
audio_play_sound(sndPickupWeapon,0,false)
global.done=0
instance_destroy()
}
}
} else pressltrig=0
