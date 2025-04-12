if global.xbox=1 scrXboxRestart()
if keyboard_check_pressed(ord(global.restartkey)) event_perform(ev_keypress,ord("R"))
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
my_id.sprite_index=sprPWalkUnarmed
my_id.ammo=ammo
my_id.maskon=1
my_id.maskindex=global.maskindex
instance_destroy()
}
}
}


if instance_exists(objPlayer) {
global.test=0
with objPlayer {if place_meeting(x+lengthdir_x(16,dir),y+lengthdir_y(16,dir),objHobo) {if sprite_index=sprPAttackPunch global.test=2 if sprite_index=sprPAttackBat global.test=1}}
if global.test=1 {
pdir=point_direction(objPlayer.x,objPlayer.y,x,y)
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
my_id=instance_create(x,y,objHoboKnockedOut)
my_id.direction=point_direction(objPlayer.x,objPlayer.y,x,y)
my_id.speed=2
my_id.image_angle=my_id.direction
if sprite_index=sprHoboWalkBat or sprite_index=sprHoboAttack {
my_id=instance_create(x,y,objWeaponThrow)
my_id.image_index=4
my_id.direction=random(360)
my_id.speed=random(2)
my_id.ammo=0
}
audio_play_sound(sndDoorHit,0,false)
audio_play_sound(sndHit,0,false)
instance_destroy()
}

if global.test=2 {
my_id=instance_create(x,y,objHoboKnockedOut)
my_id.direction=point_direction(objPlayer.x,objPlayer.y,x,y)
my_id.speed=2
my_id.image_angle=my_id.direction
if sprite_index=sprHoboWalkBat or sprite_index=sprHoboAttack {
my_id=instance_create(x,y,objWeaponThrow)
my_id.image_index=4
my_id.direction=random(360)
my_id.ammo=0
my_id.speed=random(2)
}
audio_play_sound(sndDoorHit,0,false)
instance_destroy()
}
} else {
speed=0
if sprite_index=sprHoboWalk image_speed=0
exit
}

scrMoveSolidOn()

if reload>0 reload-=1
if sprite_index=sprHoboWalk nothing=0 else global.factor+=sign(alert)
if path_index>0 {
if image_speed<0.2 image_speed=0.2
if alert=0 and path_position=1 path_end()
} else {
if image_speed<1 image_speed=speed*0.1
/*if !place_free(x,y) {
tempdir=direction
i=1
while (!place_free(x+lengthdir_x(4+i/20,tempdir),y+lengthdir_y(4+i/20,tempdir))) and i<100 {
tempdir+=18
i+=1
}
if i<100 move_outside_solid(tempdir,4+i/20)
}*/

}

if image_speed>=0.5 {
if place_meeting(x+lengthdir_x(8,angle),y+lengthdir_y(8,angle),objPlayer) {
global.my_id=id
scrPlayerDieMelee()
}
}

scrHoboStep()
scrMoveSolidOff()

/* */
/*  */
