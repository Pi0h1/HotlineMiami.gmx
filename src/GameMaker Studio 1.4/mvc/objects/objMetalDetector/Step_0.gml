if wait>0 {
wait-=1
if wait=0 {
on=0
global.test=0
with objMetalDetector {if on=1 global.test=1}
if !global.test {audio_stop_sound(sndAlarm) global.alarmsound=0}
}
}
if place_meeting(x,y,objPlayer) {
if objPlayer.sprite_index=sprPWalkUnarmed or objPlayer.sprite_index=sprPWalkBat or objPlayer.sprite_index=sprPWalkPool or objPlayer.sprite_index=sprPWalkPoolBroke or objPlayer.sprite_index=sprPAttackThrow or objPlayer.sprite_index=sprPAttackPunch or objPlayer.sprite_index=sprPAttackBat or objPlayer.sprite_index=sprPAttackPool or objPlayer.sprite_index=sprPAttackPoolBroke or objPlayer.sprite_index=sprPWalkNightStick or objPlayer.sprite_index=sprPAttackNightStick  nothing=1 else {
if objPlayer.sprite_index=sprPWalkThrow {
if objPlayer.throwindex>=1 and objPlayer.throwindex<=3 nothing=1 else {if on=0 {if global.alarmsound=0 {audio_play_sound(sndAlarm,0,false) global.alarmsound=1} on=1 scrHearPlayer()} wait=180} 
} else {if on=0 {if global.alarmsound=0 {audio_play_sound(sndAlarm,0,false) global.alarmsound=1} on=1 scrHearPlayer()} wait=180}
} 
}

