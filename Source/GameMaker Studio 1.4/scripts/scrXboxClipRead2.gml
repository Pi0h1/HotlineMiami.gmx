if gettrigger_r()>100 or gettrigger_l()>100 {
if seen=1 exit
if place_meeting(x+lengthdir_x(12,objPlayer.dir-180),y+lengthdir_y(12,objPlayer.dir-180),objPlayer) {
scrGetMessage(2)
seen=1
}
}
