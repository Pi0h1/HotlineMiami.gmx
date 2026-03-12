if gettrigger_r()>100 or gettrigger_l()>100 {
if !instance_exists(objPlayerMouseHouse) or talked>3 or instance_exists(objPhoneConversation) or objPlayer.active=0 exit
if place_meeting(x+lengthdir_x(32,90),y+lengthdir_y(32,90),objPlayer){
objPlayer.image_index=0
objPlayer.active=0
scrGetMessage(talked)
talked+=1
}
}
