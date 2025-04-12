if !instance_exists(objPlayer) {speed=0 state=1000}
if sprite_index=sprBoss1Taunt {
image_speed=0
if image_index<4 image_index+=0.15 else {sprite_index=sprBoss1Walk}
speed=0
exit
}
if keyboard_check_pressed(ord(global.restartkey)) event_perform(ev_keypress,ord("R"))
if global.xbox=1 scrXboxRestart()
if state=0 {
if objEffector.amount>=180 {
if instance_exists(objPlayerMouse) {
with objPlayerMouse {
my_id=instance_create(x,y,objPlayerMouseHouse)
my_id.active=0
my_id.sprite_index=sprite_index
my_id.ammo=ammo
global.maskon=1
my_id.maskon=1
instance_destroy()
}
}
sxeasy_play(working_directory+"\\Release.mp3")
scrGetMessage(0)
state=1
test=objPlayer.persistent
objPlayer.persistent=0
global.loaded=1
scrSaveGame()
//if !instance_exists(objMaskMenu) instance_create(x,y,objCheckpoint)
global.loaded=0
objPlayer.persistent=test
}
}

if state=1 {
if !instance_exists(objPhoneConversation) {
state=2
with objPlayer {
my_id=instance_create(x,y,objPlayerMouse)
my_id.active=0
my_id.sprite_index=sprite_index
my_id.ammo=ammo
my_id.maskon=1
my_id.maskindex=global.maskindex
instance_destroy()
}
}
}

if state=2 {
if point_distance(x,y,objPlayer.x,objPlayer.y)<16 {
if scrIsSwinging(objPlayer.sprite_index) {
audio_play_sound(sndKnifeWall,0,false)
with objPlayer {
lastweapon=scrCurrentWeapon()
lastammo=ammo
global.exposed=0
release=0


if sprite_index=sprPWalkUnarmed or sprite_index=sprPAttackPunch nothing=1 else {
my_id=instance_create(objPlayer.x+lengthdir_x(8,objPlayer.dir+90),objPlayer.y+lengthdir_y(8,objPlayer.dir+90),objWeaponThrow)
my_id.image_index=lastweapon
my_id.direction=dir+70+random(40)
my_id.speed=1+random(2)
my_id.ammo=lastammo
sprite_index=sprPWalkUnarmed
}
}
if hit<2 {
sprite_index=sprBoss1Taunt
image_index=0
hit=2
exit
}
} else {
if sprite_index=sprBoss1Walk {
sprite_index=sprBoss1Attack
image_index=0
}
image_speed=0.25
speed=0
global.my_id=id
if instance_exists(objPlayer) scrPlayerDieMelee()
exit
}
}

if wait>0 wait-=1 else {
mask_index=sprWeaponMask
if !scrCollisionLineDouble(x,y,objPlayer.x,objPlayer.y,4,objSolid,objFurniture) {
path_end()
speed=3 
direction=point_direction(x,y,objPlayer.x,objPlayer.y)
image_index+=0.3
image_speed=0
} else {
wait=20
path_end()
if mp_grid_path(global.grid,path,x,y,objPlayer.x-32+random(64),objPlayer.y-32+random(64),1)>0 {path_start(path,2.5,0,1) image_speed=0.3 speed=0} else {image_speed=0 speed=0}
}
mask_index=sprMask
}
}

