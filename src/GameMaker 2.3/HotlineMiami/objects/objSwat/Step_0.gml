global.done=1
if sprite_index=sprSwatStumble {
scrMoveSolidOn()
if !place_free(x+hspeed*2,y) hspeed=0
if !place_free(x,y+vspeed*2) vspeed=0
scrMoveSolidOff()
exit
}
scrMoveSolidOn()
if path_index>0 {
image_speed=0.2
if alert=0 and path_position=1 path_end()
} else {
if image_speed<1 image_speed=speed*0.1
}

scrESwatStep()
scrMoveSolidOff()

with objEnemy {
if scrCantGetHit(object_index) nothing=1 else {
my_id=instance_create(x,y,objEGiveUp)
my_id.image_angle=angle
if sprite_index=sprEWalkUnarmed or sprite_index=sprEGiveUp nothing=1 else {
my_id=instance_create(x,y,objWeaponThrow)
my_id.direction=random(360)
my_id.image_index=scrCurrentWeaponExt(sprite_index)
my_id.ammo=ammo
}
instance_destroy()
}
}

if !instance_exists(objPlayer) {alert=0 direction=round(direction*(1/10))*10 exit} else {
if objPlayer.sprite_index=sprPAttackPunch or objPlayer.sprite_index=sprPAttackClub or objPlayer.sprite_index=sprPAttackBat or objPlayer.sprite_index=sprPAttackKnife or objPlayer.sprite_index=sprPAttackPipe or objPlayer.sprite_index=sprPAttackPool or objPlayer.sprite_index=sprPAttackAxe or objPlayer.sprite_index=sprPAttackSword or objPlayer.sprite_index=sprPAttackSledgeHammer or objPlayer.sprite_index=sprPAttackPan or objPlayer.sprite_index=sprPAttackPot or objPlayer.sprite_index=sprPAttackMachete or objPlayer.sprite_index=sprPAttackDrill {
if place_meeting(x-lengthdir_x(24,objPlayer.dir),y-lengthdir_y(24,objPlayer.dir),objPlayer) or place_meeting(x,y,objPlayer) {
my_id=instance_create(x,y,objSwatKnockedOut)
my_id.direction=point_direction(objPlayer.x,objPlayer.y,x,y)
my_id.speed=1.5
my_id.friction=0.1
my_id.angle=my_id.direction
audio_play_sound(sndDoorHit,0,false)
audio_play_sound(sndPunch,0,false)
instance_destroy()
}
}
}

