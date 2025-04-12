with objCheckpoint instance_destroy()

if instance_number(objEnemy)+instance_number(objKnockedOut)+instance_number(objPlayerShieldMouse)=0 {
with objDoorH solid=0
with objDoorH2 solid=0
}
if !instance_exists(objPlayer) exit
if state=0 {
if objPlayer.y<96 and objPlayer.x>424 and objPlayer.x<608 {
state=1
wait=20
}
}

if state=1 {
if wait>0 wait-=1 else {scrGetMessage(0) sprite_index=sprClubOwnerTalk state=2}
direction=scrRotate(direction,point_direction(x,y,objPlayer.x,objPlayer.y),10)
with objPlayerMouse {
my_id=instance_create(x,y,objPlayerMouseHouse)
my_id.active=0
my_id.sprite_index=sprite_index
my_id.ammo=ammo
global.maskon=1
my_id.maskon=1
instance_destroy()
with objEffector instance_destroy()
my_id=instance_create(x,y,objEffectorHouse)
my_id.blackx=0
my_id.amount=180
}

}

if state=2 {
if !instance_exists(objPhoneConversation) {
if image_speed>0 {image_index=0 image_speed=0 sprite_index=sprClubOwnerFall}
if image_index<15 image_index+=0.125 else state=3
if image_index<6 {
x+=lengthdir_x(0.5,90)
y+=lengthdir_y(0.5,90)
direction=scrRotate(direction,point_direction(x,y,objPlayer.x,objPlayer.y),10)
}
} else image_speed=0.2
}

if state=3 {
if image_index<15.25 image_index+=0.125 else image_index=12
scrGetMessage(1)
state=4
}

if state=4 {
if image_index<15.25 image_index+=0.125 else image_index=12
if !instance_exists(objPhoneConversation) {
with objPlayerMouseHouse {
my_id=instance_create(x,y,objPlayerMouse)
my_id.active=0
my_id.sprite_index=sprite_index
my_id.ammo=ammo
my_id.maskon=1
my_id.maskindex=global.maskindex
instance_destroy()
}
with objEffectorHouse {instance_destroy() }
viewx=camera_get_view_x(view_camera[0])
viewy=camera_get_view_y(view_camera[0])
with objEffector instance_destroy()
my_id=instance_create(x,y,objEffector)
my_id.blackx=15
my_id.amount=180
__view_set( e__VW.XView, 0, viewx )
__view_set( e__VW.YView, 0, viewy )
state=5
}
}

if state=5 {
if image_index<15.25 image_index+=0.125 else image_index=12
if point_distance(x+lengthdir_x(14,direction-180),y+lengthdir_x(14,direction-180),objPlayer.x,objPlayer.y)<12 {
with objPlayer {
if sprite_index=sprPWalkUnarmed or sprite_index=sprPAttackPunch nothing=1 else {
my_id=instance_create(objPlayer.x+lengthdir_x(8,objPlayer.dir+90),objPlayer.y+lengthdir_y(8,objPlayer.dir+90),objWeaponThrow)
my_id.image_index=scrCurrentWeaponExt(sprite_index)
my_id.direction=dir+70+random(40)
my_id.speed=1+random(2)
my_id.ammo=0
}
instance_destroy()
}
my_id=instance_create(x,y,objPKillOwner)
my_id.image_angle=image_angle-180
instance_destroy()
}
}

/*
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
sxeasy_play(working_directory+"\Release.mp3")
scrGetMessage(0)
state=1
test=objPlayer.persistent
objPlayer.persistent=0
global.loaded=1
game_save(working_directory+"\tempsave.sav")
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
}*/
/* */
/*  */
