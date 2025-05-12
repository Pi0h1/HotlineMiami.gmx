if sprite_index=sprEWalkUnarmed nothing=0 else global.factor+=sign(alert)
scrMoveSolidOn()
if sprite_index=sprEWalkUnarmed scrGoGetWeapon()
if !place_free(x+hspeed*3,y+vspeed*3) {
if !place_free(x+hspeed*3,y) hspeed=-hspeed
if !place_free(x,y+vspeed*3) vspeed=-vspeed
}
if path_index>0 {
image_speed=0.2
if path_position=1 path_end()
} else image_speed=speed*0.1
scrMoveSolidOff()
if !instance_exists(objPlayer) {alert=0 speed=0 exit}

scrEStaticStep()
