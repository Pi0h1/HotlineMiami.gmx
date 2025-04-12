if sprite_index=sprFatmanShitDie {
if image_index<4 image_index+=0.2
image_speed=0
exit
}
if sprite_index=sprFatmanShitDecapitated {
if image_index<4 image_index+=0.2
image_speed=0
exit
}
if !instance_exists(objPlayer) exit
if sprite_index=sprFatmanShit {
test=scrLook(objPlayer.x,objPlayer.y,4)
if test=0 or test=2 {
image_index=0
image_speed=0
sprite_index=sprFatmanShitGiveUp
}
}

if sprite_index=sprFatmanShitGiveUp {
if image_index<4 image_index+=0.2
}

if objPlayer.sprite_index=sprPAttackAxe {
if place_meeting(x+4,y,objPlayer) {
my_id=instance_create(x-4,y,objBodyPart)
my_id.sprite_index=sprFatmanHead
my_id.direction=0
my_id.speed=2
repeat (10) {
my_id=instance_create(x-3,y,objBloodSquirt)
my_id.direction=random(360)
my_id.image_angle=random(360)
}
repeat (10) {
my_id=instance_create(x-7+random(6),y-3+random(6),objBloodDrop)
my_id.image_xscale=1-random(0.2)
my_id.image_yscale=my_id.image_xscale
my_id.image_angle=point_direction(x-4,y,my_id.x,my_id.y)
my_id.direction=my_id.image_angle
my_id.speed=1+random(5)
}
repeat (5) {
my_id=instance_create(x-7+random(6),y-3+random(6),objBloodSmoke)
my_id.image_xscale=1.2-random(0.2)
my_id.image_yscale=my_id.image_xscale
my_id.image_angle=point_direction(x-4,y,my_id.x,my_id.y)
my_id.direction=my_id.image_angle
my_id.speed=2+random(1)
my_id.friction=0.15
}
audio_play_sound(sndHit,0,false)
audio_play_sound(sndCut1,0,false)
SteamSetAchievement("ACH_SMELL_SOMETHING_BURNING")
sprite_index=sprFatmanShitDecapitated
image_index=0
}
}

