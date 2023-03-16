if gettrigger_r()>100 or gettrigger_l()>100 {
if active=0 exit
if !instance_exists(objPlayer) exit
if objPlayer.x>x-12 and objPlayer.x<x+12 {
if place_meeting(x,y-8,objPlayer) {
with objPlayer instance_destroy()
instance_create(x,y-21,objPlayerBikerHack)
alarm[0]=120
active=0
}
}
}
