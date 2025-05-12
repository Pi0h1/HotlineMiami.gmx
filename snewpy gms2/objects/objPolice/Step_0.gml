if sprite_index=sprPoliceWalkUnarmed nothing=0 else global.factor+=sign(alert)
scrMoveSolidOn()
if sprite_index=sprPoliceWalkUnarmed scrPoliceGetWeapon()
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

scrPoliceRandomStep()

/*




if sprite_index=sprPoliceWalkUnarmed nothing=0 else global.factor+=sign(alert)
scrMoveSolidOn()
if path_index>0 {
image_speed=0.1
if path_position=1 {alert=0 path_end()}
} else {
if image_speed<1 image_speed=speed*0.1
if !place_free(x+hspeed*4,y) hspeed=-hspeed
if !place_free(x,y+vspeed*4) vspeed=-vspeed
}

scrPoliceRandomStep()
if !instance_exists(objPlayer) {alert=0 scrMoveSolidOff() exit}



friction=0

scrMoveSolidOff()
/* */
/*  */
