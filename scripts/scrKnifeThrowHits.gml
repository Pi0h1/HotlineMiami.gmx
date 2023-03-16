global.gunkill=0
global.shake=3


edir=other.direction
test=0
repeat (2) {
my_id=instance_create(x-3+random(6)+lengthdir_x(8,edir),y-3+random(6)+lengthdir_y(8,edir),objBloodDrop)
my_id.image_xscale=1-random(0.2)
my_id.image_yscale=my_id.image_xscale
my_id.image_angle=point_direction(x+lengthdir_x(8,edir),y+lengthdir_y(8,edir),my_id.x,my_id.y)
my_id.sprite_index=sprBloodSplatSmall
my_id.direction=my_id.image_angle
my_id.speed=2+random(4)
}
repeat (1) {
my_id=instance_create(x-3+random(6)+lengthdir_x(8,edir),y-3+random(6)+lengthdir_y(8,edir),objBloodDrop)
my_id.image_xscale=1-random(0.2)
my_id.image_yscale=my_id.image_xscale
my_id.image_angle=point_direction(x+lengthdir_x(8,edir),y+lengthdir_y(8,edir),my_id.x,my_id.y)
my_id.direction=my_id.image_angle
my_id.speed=1+random(5)
}
repeat (1) {
my_id=instance_create(x-3+random(6)+lengthdir_x(16,edir),y-3+random(6)+lengthdir_y(16,edir),objBloodSmoke)
my_id.image_xscale=1.2-random(0.2)
my_id.image_yscale=my_id.image_xscale
my_id.image_angle=edir-20+random(40)
my_id.direction=my_id.image_angle
my_id.speed=2+random(1)
my_id.friction=0.15
}
scrIdleGetEnemy()

my_id=instance_create(x,y,objDeadBody)
my_id.sprite_index=sprEBackCut
my_id.image_index=5+round(random(1))
if global.my_id.object_index=objThrowingWeapon {
if global.my_id.image_index=0 my_id.image_index=7+round(random(1))
if global.my_id.image_index=5 my_id.image_index=9+round(random(1))
}
if global.my_id.object_index=objThrowingKnife {
my_id.image_index=11+round(random(1))
}
my_id.direction=edir
my_id.speed=1.5+random(1)
my_id.image_angle=my_id.direction
if sprite_index=sprEWalkUnarmed or sprite_index=sprEGiveUp noweapon=1 else noweapon=0
my_id=instance_create(x,y-12,objScore)
if noweapon=0 {
my_id.text="+"+string((800)*global.factor)+"pts"
global.myscore+=(800)*global.factor
my_id=instance_create(x,y,objWeaponThrow)
my_id.direction=other.direction-70+random(40)
my_id.speed=2+random(2)
my_id.image_index=scrCurrentWeaponExt(sprite_index)
my_id.ammo=ammo
} else {
my_id.text="+"+string((300)*global.factor)+"pts"
global.myscore+=(300)*global.factor
global.boldscore+=300*global.factor
}
instance_destroy()
audio_play_sound(choose(sndCut1,sndCut2),0,false)

with global.my_id {
my_id=instance_create(x,y,objBloodSmoke)
my_id.direction=direction-170+random(10)
my_id.speed=1
my_id.image_angle=my_id.direction
my_id.image_xscale=0.8+random(0.2)
my_id.image_yscale=my_id.image_xscale
instance_destroy()
}
