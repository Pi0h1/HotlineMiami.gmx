scrMoveSolidOn()
with objDoorV {test=solid solid=1}
if !place_free(x+lengthdir_x(8,direction),y+lengthdir_y(8,direction)) { 
    direction=round(direction*0.1)*10
    direction+=diradd*10
} else {
    direction=round(direction*0.1)*10
    if place_free(x+lengthdir_x(8,direction-90*diradd),y+lengthdir_y(8,direction-90*diradd)) {
    direction-=diradd*10
    turn=1
    dir+=10
    if dir>180 and abs(frac(direction*(1/90)))=0 findwall=1
    } else {
    if turn=1 {if abs(frac(direction*(1/90)))>0 direction-=diradd*10 else turn=0} else {
        if abs(frac(direction*(1/90)))>0 direction+=diradd*10
        }
    }
}

scrMoveSolidOff()
with objDoorV {solid=test}
