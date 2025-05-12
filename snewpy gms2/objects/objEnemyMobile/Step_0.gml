
scrMoveSolidOn()

if sprite_index=sprEWalkUnarmed nothing=0 else global.factor+=sign(alert)
if path_index>0 {
image_speed=0.2
if alert=0 and path_position=1 path_end()
} else {
if image_speed<1 image_speed=speed*0.1
}

scrEMobileStep()
scrMoveSolidOff()

if !instance_exists(objPlayer) {alert=0 direction=round(direction*(1/10))*10 exit}
