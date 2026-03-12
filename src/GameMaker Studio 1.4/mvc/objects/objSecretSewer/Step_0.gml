if !instance_exists(objPlayerMouse) exit
if global.done=0 exit
if open=1 {
if enter=0 {
if place_meeting(x+6,y,objPlayerMouse) {
if objPlayerMouse.y>y-8 and objPlayerMouse.y<y+8 {
enter=1
with objPlayerMouse {
my_id=instance_create(objSecretSewer.x+18,objSecretSewer.y,objPlayerClimbDown)
my_id.image_angle=dir
instance_destroy()
}
}
}
}
}
else {
if place_meeting(x+6,y,objPlayerMouse) {
if objPlayer.sprite_index=sprPWalkCrowbar {
with objPlayer {
instance_destroy()
}
global.executionx=x+20
global.executiony=y
instance_create(x+15,y,objPlayerOpenGrate)
}
}
}


