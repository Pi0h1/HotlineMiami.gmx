if gettrigger_r()>100 or gettrigger_l()>100 {
if !instance_exists(objPlayerMouseHouse) or talked=1 exit
if place_meeting(x+lengthdir_x(32,270),y+lengthdir_y(32,270),objPlayer){
objPlayer.image_index=0
objPlayer.active=0
image_index=1
scrGetMessage(0)
talked=1
global.talked=1
}
}
