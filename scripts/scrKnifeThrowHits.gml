global.gunkill=0
global.shake=3

edir=other.direction
test=0
scrIdleGetEnemy()
createBlood(edir);
createDeadBody(false,1.5,sprEThrownKnife,edir)
if sprite_index=sprEWalkUnarmed or sprite_index=sprEGiveUp noweapon=1 else noweapon=0
my_id=instance_create(x,y-12,objScore)
if noweapon=0 {
my_id.text="+"+string((800)*global.factor)+"pts"
global.myscore+=(800)*global.factor
/*my_id=instance_create(x,y,objWeaponThrow)
my_id.direction=other.direction-70+random(40)
my_id.speed=2+random(2)
my_id.image_index=scrCurrentWeaponExt(sprite_index)
my_id.ammo=ammo*/
} else {
my_id.text="+"+string((300)*global.factor)+"pts"
global.myscore+=(300)*global.factor
global.boldscore+=300*global.factor
}
instance_destroy()
PlaySFX("Light Cut")

with global.my_id {
my_id=instance_create(x,y,objBloodSmoke)
my_id.direction=direction-170+random(10)
my_id.speed=1
my_id.image_angle=my_id.direction
my_id.image_xscale=0.8+random(0.2)
my_id.image_yscale=my_id.image_xscale
instance_destroy()
}
