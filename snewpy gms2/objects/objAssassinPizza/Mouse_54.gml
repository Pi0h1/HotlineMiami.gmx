if !instance_exists(objPlayerMouseHouse) or talked=1 or instance_exists(objPhoneConversation) or objPlayer.active=0 exit
if place_meeting(x+lengthdir_x(32,270),y+lengthdir_y(32,270),objPlayer){
objPlayer.image_index=0
objPlayer.active=0
scrGetMessage(0)
talked=1
}
