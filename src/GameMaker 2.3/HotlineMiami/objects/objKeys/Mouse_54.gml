if !instance_exists(objPlayerMouse) exit
if place_meeting(x-lengthdir_x(12,objPlayer.dir),y-lengthdir_y(12,objPlayer.dir),objPlayer) {
instance_destroy()
global.locked=0
audio_play_sound(sndPickupWeapon,0,false)
}

