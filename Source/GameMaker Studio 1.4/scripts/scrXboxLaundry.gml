if gettrigger_l()>100 {
if pressltrig=0 {
pressltrig=1
if room=rmSequence13 {
with objPlayerMouseHouse {
if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objLaundryBasket) {
if objLaundryBasket.clothes=1 {
objLaundryBasket.clothes=0
with objPlayerPants visible=1
with objPlayerJacket visible=1
}
}
}
}
}
} else pressltrig=0
