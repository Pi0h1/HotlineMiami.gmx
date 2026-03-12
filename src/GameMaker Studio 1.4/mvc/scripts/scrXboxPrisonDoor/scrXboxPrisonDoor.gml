if gettrigger_r()>100 or gettrigger_l()>100 {
if solid=0 or instance_exists(objEnemy) or instance_exists(objKnockedOut) exit
if global.locked=0 {
if place_meeting(x,y+4,objPlayer) {
solid=0
audio_play_sound(sndPickupWeapon,0,false)
with objPlayerMouse {

if sprite_index=sprPWalkUnarmed or sprite_index=sprPAttackPunch nothing=1 else {
my_id=instance_create(objPlayer.x+lengthdir_x(8,objPlayer.dir+90),objPlayer.y+lengthdir_y(8,objPlayer.dir+90),objWeaponThrow)
my_id.image_index=scrCurrentWeaponExt(sprite_index)
my_id.direction=dir+70+random(40)
my_id.speed=1+random(2)
my_id.ammo=ammo
}


my_id=instance_create(x,y+5,objPlayerMouseHouse)
my_id.active=0
my_id.sprite_index=sprPUnlockDoor
my_id.image_speed=0.15
my_id.ammo=0
global.maskon=1
my_id.maskon=1
instance_destroy()
}
}
}
}
