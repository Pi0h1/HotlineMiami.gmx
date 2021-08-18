global.gunkill=0
global.shake=7
pdir=point_direction(global.my_id.x,global.my_id.y,x,y)
if object_get_parent(object_index)=objEnemyIdle {
if room=rmTrainstationEntrance sprite_index=choose(sprEWalkKnife,sprEWalkBat,sprEWalkClub,sprEWalkPipe) else sprite_index=choose(sprEWalkShotgun,sprEWalkM16)
}
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
my_id=instance_create(x,y,objDeadBody)
my_id.sprite_index=sprEBackBlunt
if scrIsPolice(object_index) {
my_id.sprite_index=sprPoliceBackBlunt
my_id1=instance_create(x,y,objPoliceHat)
my_id1.direction=pdir-10+random(20)
my_id1.speed=1+random(2)
}
my_id.image_index=4+random(10)
my_id.direction=pdir
my_id.speed=1.5+random(1)
my_id.image_angle=my_id.direction
if sprite_index=sprEWalkUnarmed or sprite_index=sprEGiveUp or sprite_index=sprPoliceWalkUnarmed noweapon=1 else noweapon=0
my_id=instance_create(x,y-12,objScore)
my_id.text="+"+string(300+500*global.factor+global.my_id.hits*1000)+"pts"
global.myscore+=(300+500*global.factor)+global.my_id.hits*1000
global.killscore+=300
global.boldscore+=(500*global.factor)+global.my_id.hits*1000
if global.my_id.hits>1 {
my_id=instance_create(x,y+24,objScore)
my_id.text=string(global.my_id.hits)+"x"
}
global.combotime=240
global.combo+=1
global.killx[global.kills]=x
global.killy[global.kills]=y
global.kills+=1
if noweapon=0 {
my_id=instance_create(x,y,objWeaponThrow)
my_id.direction=pdir-25+random(50)
my_id.speed=2+random(1)
my_id.image_index=scrCurrentWeaponExt(sprite_index)
my_id.ammo=ammo
}
instance_destroy()
