global.gunkill=0
global.shake=7
pdir=point_direction(global.my_id.x,global.my_id.y,x,y)

if object_get_parent(object_index)=objEnemyIdle {
if room=rmTrainstationEntrance sprite_index=choose(sprEWalkKnife,sprEWalkBat,sprEWalkClub,sprEWalkPipe) else sprite_index=choose(sprEWalkShotgun,sprEWalkM16)
}

createBlood(pdir);
createDeadBody(false,1.5,sprEBackBlunt,pdir)

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

/*if noweapon=0 {
my_id=instance_create(x,y,objWeaponThrow)
my_id.direction=pdir-25+random(50)
my_id.speed=2+random(1)
my_id.image_index=scrCurrentWeaponExt(sprite_index)
my_id.ammo=ammo
}*/

instance_destroy()
