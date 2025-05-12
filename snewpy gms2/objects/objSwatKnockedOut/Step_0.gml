scrMoveSolidOn()
if !place_free(x,y) {move_outside_solid(direction-180,8) speed=0}
scrMoveSolidOff()
if speed=0 {
if reload>0 reload-=1 else {
image_speed=0.35
}
}
