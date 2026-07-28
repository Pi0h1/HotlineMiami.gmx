if point_distance(x,y,argument0,argument1)>4 {
motion_add(point_direction(x,y,objPlayer.x,objPlayer.y),0.5)
if speed>5 speed=5
if !place_free(x+hspeed,y) hspeed=-hspeed
if !place_free(x,y+vspeed) vspeed=-vspeed
} else {
if speed>0 speed=0
}
checkreload=0
scrChargeSearch(argument0,argument1,argument3)
nothing=argument2
