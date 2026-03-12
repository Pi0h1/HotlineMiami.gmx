if gettrigger_l()>100 {
if pressltrig=0 {
pressltrig=1
if instance_exists(objPlayerMouse) or instance_exists(objPlayerMouseHouse) {
if place_meeting(x,y,objPlayer) and image_index=0 {
objPlayer.sprite_index=sprPWalkClub
objPlayer.reload=10
image_index=1
audio_play_sound(sndPickupWeapon,0,false)
}
}
}
} else pressltrig=0
