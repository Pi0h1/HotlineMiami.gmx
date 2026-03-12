if bounced=1 {
image_angle+=dir_add*speed*10
friction=0.2
}

if speed>0 {
mask_index=sprite_index
global.my_id=id
with objEnemy {
if object_index=objDogPatrol or object_index=objEnemyFat nothing=1 else {
if place_meeting(x,y,global.my_id) {
scrKnifeThrowHits()
ds_list_add(global.bonuslist,"Projectile Kill")
global.combotime=240
if global.bonustime<12+global.factor*4 global.bonustime=12+global.factor*4
}
}
}
mask_index=sprWeaponMask
}
