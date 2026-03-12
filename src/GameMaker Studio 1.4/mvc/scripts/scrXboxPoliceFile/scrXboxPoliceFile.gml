if gettrigger_l()>100 {
if pressltrig=0 {
pressltrig=1
if !instance_exists(objPlayer) or on=0 exit
if place_meeting(x-lengthdir_x(12,objPlayer.dir),y-lengthdir_y(12,objPlayer.dir),objPlayer) {
instance_destroy()
global.files=1
instance_create(x,y,objGoToCar)
audio_play_sound(sndPickupWeapon,0,false)
}
}
} else pressltrig=0
