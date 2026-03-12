angle+=speed*5*diradd
if speed<=0 {
my_id=instance_create(x,y,objWeapon)
my_id.image_angle=angle
my_id.image_index=image_index
my_id.image_yscale=left
my_id.ammo=ammo
instance_destroy()
}

if speed>2.5 {
mask_index=sprite_index
global.my_id=id
with objEnemy {
if scrCantGetHit(object_index) nothing=1 else {
if place_meeting(x,y,global.my_id) {
if object_index=objEnemyFat {global.my_id.direction=point_direction(x,y,global.my_id.x,global.my_id.y) global.my_id.speed*=0.8 exit}
if global.my_id.image_index=5 and round(random(5))<4 {
if global.my_id.bounce=1 SteamSetAchievement("ACH_PLAYING_POOL")
scrKnifeThrowHits()
} else {
if global.maskindex=24 {
if global.my_id.bounce=1 SteamSetAchievement("ACH_PLAYING_POOL")
audio_play_sound(sndHit,0,false)
audio_play_sound(sndPunch,0,false)
scrEnemyDieMelee()
} else {
if global.my_id.bounce=1 SteamSetAchievement("ACH_PLAYING_POOL")
audio_play_sound(sndDoorHit,0,false)
global.shake=3
my_id=instance_create(x,y,objKnockedOut)
if global.my_id.enemy=1 SteamSetAchievement("ACH_DOMINO_EFFECT")
my_id.type=object_index
if scrIsPolice(object_index) my_id.sprite_index=sprPoliceGetUp
my_id.direction=global.my_id.direction-10+random(20)
my_id.angle=my_id.direction
with my_id move_outside_solid(angle-180,16)
my_id.speed=global.my_id.speed*0.25
global.my_id.speed*=-0.8
if sprite_index=sprEWalkUnarmed or sprite_index=sprPoliceWalkUnarmed noweapon=1 else noweapon=0
scrIdleGetEnemy()
if noweapon=0 {
global.test=0
with objEnemy if alert=1 global.test+=1
my_id=instance_create(x,y-12,objScore)
my_id.text="+"+string((300*global.factor))+"pts"
global.myscore+=(300*global.factor)
global.boldscore+=300*global.factor
global.combotime+=100
global.killx[global.kills]=x
global.killy[global.kills]=y
global.kills+=1
my_id=instance_create(x,y,objWeaponThrow)
my_id.direction=direction-70+random(40)
my_id.image_index=scrCurrentWeaponExt(sprite_index)
my_id.speed=2+random(2)
my_id.ammo=ammo
my_id.enemy=1
}
instance_destroy()
}
}
}
}
}
}
mask_index=sprWeaponMask

