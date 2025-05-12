if !instance_exists(objPlayer) exit
if room=rmTrainstationEntrance {
if objTrain.visible=1 {
if !place_meeting(x,y,objPlayer) solid=1 visible=0
exit
}
}
if instance_exists(objEnemy) or instance_exists(objKnockedOut) or instance_exists(objBoss) or instance_exists(objEHideM16) or instance_exists(objESubwayStatic) {if !place_meeting(x,y,objPlayer) solid=1 visible=0} else {
solid=0
if objPlayer.persistent=1 {
if !place_meeting(x,y,objPlayer) {visible=1 solid=1}
} else visible=1
}
