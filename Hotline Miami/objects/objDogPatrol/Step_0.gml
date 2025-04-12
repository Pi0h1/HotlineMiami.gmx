
global.factor+=sign(alert)
scrMoveSolidOn()
if path_index>=0 {
if image_speed<0.3 image_speed=0.3
if path_position=1 {path_end()
if alert=3 alert=0
}
} else {
image_speed=speed*0.1
if !place_free(x,y) and alert=0 {
tempdir=direction
i=1
while (!place_free(x+lengthdir_x(4+i/20,tempdir),y+lengthdir_y(4+i/20,tempdir))) and i<100 {
tempdir+=18
i+=1
}
if i<100 move_outside_solid(tempdir,4+i/20)
}
}



if speed>1 {
if place_meeting(x,y,objPlayer) {
global.my_id=id
if objPlayer.object_index=objPlayerShieldMouse scrPlayerShieldDieDogBite() else scrPlayerDieDogBite()
instance_destroy()
}
}
scrDogStep()
scrMoveSolidOff()
