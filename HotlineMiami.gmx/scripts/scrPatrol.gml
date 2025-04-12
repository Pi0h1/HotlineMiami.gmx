scrMoveSolidOn()
if !place_free(x+lengthdir_x(8,direction),y+lengthdir_y(8,direction)) {
    //if !place_free(x+lengthdir_x(8,direction+90*diradd),y+lengthdir_y(8,direction+90*diradd)) {
    //if place_free(x+lengthdir_x(8,direction-90*diradd),y+lengthdir_y(8,direction-90*diradd)) diradd=-diradd
    //}
    direction+=diradd*10
} else {
    if abs(frac(direction*(1/90)))>0 direction+=diradd*10
}
scrMoveSolidOff()
