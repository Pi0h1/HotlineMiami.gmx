with objPlayer {
audio_play_sound(sndDogAttack,0,false)
pdir=point_direction(global.my_id.x,global.my_id.y,x,y)
repeat (8) {
my_id=instance_create(x-3+random(6)+lengthdir_x(8,pdir),y-3+random(6)+lengthdir_y(8,pdir),objBloodDrop)
my_id.image_xscale=1-random(0.2)
my_id.image_yscale=my_id.image_xscale
my_id.image_angle=point_direction(x+lengthdir_x(8,pdir),y+lengthdir_y(8,pdir),my_id.x,my_id.y)
my_id.sprite_index=sprBloodSplatSmall
my_id.direction=my_id.image_angle
my_id.speed=2+random(4)
}
repeat (2+random(3)) {
my_id=instance_create(x-3+random(6)+lengthdir_x(8,pdir),y-3+random(6)+lengthdir_y(8,pdir),objBloodDrop)
my_id.image_xscale=1-random(0.2)
my_id.image_yscale=my_id.image_xscale
my_id.image_angle=point_direction(x+lengthdir_x(8,pdir),y+lengthdir_y(8,pdir),my_id.x,my_id.y)
my_id.direction=my_id.image_angle
my_id.speed=1+random(5)
}
repeat (4) {
my_id=instance_create(x-3+random(6)+lengthdir_x(16,pdir),y-3+random(6)+lengthdir_y(16,pdir),objBloodSmoke)
my_id.image_xscale=1.2-random(0.2)
my_id.image_yscale=my_id.image_xscale
my_id.image_angle=pdir-20+random(40)
my_id.direction=my_id.image_angle
my_id.speed=2+random(1)
my_id.friction=0.15
}
my_id=instance_create(x,y,objPlayerDead)
if object_index=objPlayerBiker my_id.sprite_index=sprMCDeadDog else my_id.sprite_index=sprPBackEaten
my_id.direction=pdir
my_id.speed=2.5+random(1)
my_id.image_angle=my_id.direction
master=my_id
if object_index=objPlayerBiker my_id=instance_create(x+lengthdir_x(24,pdir),y+lengthdir_y(24,pdir),objMCHelmet) else my_id=instance_create(x+lengthdir_x(24,pdir),y+lengthdir_y(24,pdir),objMaskDrop)
my_id.direction=pdir-40+random(80)
my_id.speed=1.5+random(1)
my_id=instance_create(master.x,master.y,objDogBite)
my_id.image_angle=master.image_angle
my_id.master=master
if sprite_index=sprPWalkUnarmed or sprite_index=sprPAttackPunch or sprite_index=sprPAttackBash noweapon=1 else noweapon=0
if noweapon=0 {
my_id=instance_create(x,y,objWeaponThrow)
my_id.direction=pdir-25+random(50)
my_id.speed=2+random(1)
my_id.image_index=scrCurrentWeaponExt(sprite_index)
my_id.ammo=ammo
}
if sprite_index=sprPAttackBash {
my_id=instance_create(x,y,objKnockedOut)
my_id.angle=image_angle
my_id.type=objEnemy
}
instance_destroy()
}
