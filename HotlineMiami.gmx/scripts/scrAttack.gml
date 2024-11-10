if point_distance(x,y,argument0,argument1)>12 {
motion_add(point_direction(x,y,argument0,argument1),0.5*delta)
if speed>(3*delta) speed=3*delta
} else {
if speed>0 speed-=0.25*delta
direction=scrRotate(direction,point_direction(x,y,argument0,argument1),10)
}

checkreload=0
scrChargeSearch(argument0,argument1,argument3)
nothing=argument2
