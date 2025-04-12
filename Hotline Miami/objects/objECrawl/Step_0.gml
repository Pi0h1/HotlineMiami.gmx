if speed>0 and friction>0 {
if speed<=0.2 {friction=0 speed=0}
exit
}
with objDoorH solid=1
with objDoorV solid=1
with objShootThrough {test=solid solid=1}
image_speed=0.15
speed=0
if image_index>0 and image_index<3 speed=0.5
if image_index>5 and image_index<9 speed=0.5
if image_index>12 speed=0.5
if speed>0 {
if !place_free(x+lengthdir_x(16,direction),y+lengthdir_y(16,direction)) image_angle+=4
direction=image_angle
}
with objDoorH solid=0
with objDoorV solid=0
with objShootThrough solid=test
if !instance_exists(objPlayer) exit
if point_distance(x,y,objPlayer.x,objPlayer.y)<12 and objPlayer.object_index=objPlayerMouse {
kill=0
if global.xbox=1 kill=checkbutton(0,getid(11)) else kill=keyboard_check(vk_space)
if kill {
with objPlayer {
if sprite_index=sprPWalkUnarmed or sprite_index=sprPWalkBag nothing=1 else {
my_id=instance_create(objPlayer.x+lengthdir_x(8,objPlayer.dir-90),objPlayer.y+lengthdir_y(8,objPlayer.dir-90),objWeaponThrow)
my_id.image_index=scrCurrentWeaponExt(sprite_index)
my_id.direction=dir-70-random(40)
my_id.speed=1+random(2)
my_id.ammo=ammo
sprite_index=sprPWalkUnarmed
}
}

my_id=instance_create(x,y,objPAttackSnap)
if objPlayer.sprite_index=sprPWalkBag or objPlayer.sprite_index=sprPAttackBag my_id.bag=1
my_id.maskindex=objPlayer.maskindex
my_id.maskon=1
my_id.image_angle=image_angle
with objPlayer {if object_index=objPlayerMouse or object_index=objPlayerController instance_destroy()}

instance_destroy()


}
}
