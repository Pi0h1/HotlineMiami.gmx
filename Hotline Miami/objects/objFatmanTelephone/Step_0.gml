if sprite_index=sprFatmanTelephoneDie {
if image_index<4 image_index+=0.2
image_speed=0
exit
}
if !instance_exists(objPlayer) exit
if sprite_index=sprFatmanTelephone {
test=scrLook(objPlayer.x,objPlayer.y,4)
if test=0 or test=2 {
image_index=0
image_speed=0
sprite_index=sprFatmanTelephoneGiveUp
}
}

if sprite_index=sprFatmanTelephoneGiveUp {
if image_index<4 image_index+=0.2
}
