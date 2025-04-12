if object_get_parent(object_index)=objEnemyIdle energie=0
global.my_id=id
if other.passed=1 {
if object_get_parent(object_index)=objEnemyIdle {
instance_destroy()
my_id=instance_create(x,y,objEnemy)
my_id.alert=2
exit
}
global.my_x=other.dirx
global.my_y=other.diry
with objEnemy {
if scrCollisionLineExt(x,y,global.my_id.x,global.my_id.y,4,objSolid,objDoorV,objWallSoftH)=0 {
alert=2
if sprite_index=sprEWalkUnarmed alert=0
if sprite_index=sprEWalkShotgun or sprite_index=sprEWalkSilencer or sprite_index=sprEWalkDoubleBarrel or sprite_index=sprEWalkSilencer checkreload=50 else checkreload=5
reload=10
chasex=global.my_x
chasey=global.my_y
}
}
}
image_xscale=1.5
image_yscale=1.5
bullets=0
energie-=1+other.caliber
with objBullet {
if place_meeting(x,y,global.my_id) {
my_id=instance_create(x,y,objBloodSmoke)
my_id.direction=direction-170+random(10)
my_id.speed=1
my_id.image_angle=my_id.direction
my_id.image_xscale=0.8+random(0.2)
my_id.image_yscale=my_id.image_xscale
if caliber=0 instance_destroy()
global.my_id.bullets+=1
}
}
image_xscale=1
image_yscale=1
edir=other.direction
test=0
repeat (2*bullets) {
my_id=instance_create(x-3+random(6)+lengthdir_x(8,edir),y-3+random(6)+lengthdir_y(8,edir),objBloodDrop)
my_id.image_xscale=1-random(0.2)
my_id.image_yscale=my_id.image_xscale
my_id.image_angle=point_direction(x+lengthdir_x(8,edir),y+lengthdir_y(8,edir),my_id.x,my_id.y)
my_id.sprite_index=sprBloodSplatSmall
my_id.direction=my_id.image_angle
my_id.speed=2+random(4)
}
repeat (1+random(bullets)) {
my_id=instance_create(x-3+random(6)+lengthdir_x(8,edir),y-3+random(6)+lengthdir_y(8,edir),objBloodDrop)
my_id.image_xscale=1-random(0.2)
my_id.image_yscale=my_id.image_xscale
my_id.image_angle=point_direction(x+lengthdir_x(8,edir),y+lengthdir_y(8,edir),my_id.x,my_id.y)
my_id.direction=my_id.image_angle
my_id.speed=1+random(5)
}
repeat (bullets) {
my_id=instance_create(x-3+random(6)+lengthdir_x(16,edir),y-3+random(6)+lengthdir_y(16,edir),objBloodSmoke)
my_id.image_xscale=1.2-random(0.2)
my_id.image_yscale=my_id.image_xscale
my_id.image_angle=edir-20+random(40)
my_id.direction=my_id.image_angle
my_id.speed=2+random(1)
my_id.friction=0.15
}
if bullets>1 or round(random(1)) or energie<0 {
if sprite_index=sprEWalkUnarmed noweapon=1 else noweapon=0
scrIdleGetEnemy()
global.punchonly=0
if noweapon=1 factor=0.5 else factor=1
my_id=instance_create(x,y-12,objScore)
my_id.text="+"+string(((100+bullets*20)+80*factor)*global.factor)+"pts"
global.myscore+=((100+bullets*20)+80*factor)*global.factor
global.killscore+=(100+bullets*20)
global.boldscore+=80*factor
global.combo+=1
global.combotime=240
global.killx[global.kills]=x
global.killy[global.kills]=y
global.kills+=1
my_id=instance_create(x,y,objDeadBody)
if bullets>1 my_id.sprite_index=choose(sprEBackShotgun,sprEBackShotgun,sprEFrontShotgun) else my_id.sprite_index=choose(sprEBackMachinegun,sprEBackMachinegun,sprEFrontMachinegun)
my_id.image_index=1+floor(random(4))
my_id.direction=edir
my_id.speed=1.5+random(1)+bullets*0.15
my_id.image_angle=my_id.direction


if noweapon=0 {
my_id=instance_create(x,y,objWeaponThrow)
my_id.image_index=scrCurrentWeaponExt(sprite_index)
my_id.direction=other.direction-70+random(40)
my_id.speed=2+random(2)
my_id.ammo=ammo
}
instance_destroy()
}

