if gettrigger_r()>100 or gettrigger_l()>100 {
if !instance_exists(objPlayerBikerHouse) or global.talked=1 exit
if place_meeting(x+lengthdir_x(32,90),y+lengthdir_y(32,90),objPlayer){
objPlayer.image_index=0
objPlayer.active=0
objPlayer.sprite_index=sprMCPickUpPhone
sprite_index=sprPimpPhoneOff
scrGetMessage(0)
global.talked=1
global.done=1
global.phone=1
audio_play_sound(sndPhone,0,false)
}
}
