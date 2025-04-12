scrMoveSolidOn()
if sprite_index=sprPoliceWalkUnarmed nothing=0 else global.factor+=sign(alert)
if path_index>0 {
image_speed=0.1
if path_position=1 {path_end() direction=round(direction*0.1)*10}
} else {
if image_speed<1 image_speed=speed*0.1
if !place_free(x,y) {
tempdir=direction
i=1
while (!place_free(x+lengthdir_x(4+i/20,tempdir),y+lengthdir_y(4+i/20,tempdir))) and i<100 {
tempdir+=18
i+=1
}
if i<100 move_outside_solid(tempdir,4+i/20)
}
}

scrPolicePatrolStep()
scrMoveSolidOff()

if !instance_exists(objPlayer) {alert=0 direction=round(direction*(1/10))*10 exit}

