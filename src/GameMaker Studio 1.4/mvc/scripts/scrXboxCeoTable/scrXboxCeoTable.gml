if gettrigger_r()>100 or gettrigger_l()>100 {
if active=0 or instance_exists(objCEO) exit
if place_meeting(x,y-8,objPlayerBikerHouse) {
if objPlayer.x>x+6 and objPlayer.x<x+18 {
with objPlayer instance_destroy()
instance_create(x+12,y-26,objPlayerBikerHack)
alarm[0]=120
active=0
}
}
}
