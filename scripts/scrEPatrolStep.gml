angle=direction
image_speed=speed*0.1
if sprite_index=sprEWalkUnarmed {
scrGoGetWeapon()
} else {
if alert=0 {
    if instance_exists(objPlayer) scrSearch(objPlayer.x,objPlayer.y,4)
    if alertwait>-1 {if alertwait=0 {path_end() alert=1} alertwait-=1}
    if scrIsSearching(sprite_index) {image_speed=0.2 speed=0 exit}
    if returning=0 {if speed=0 {speed=1 direction=startdir} scrPatrol()} else {//if point_distance(x,y,startx,starty)>4 scrReturn(path) else {
    returning=0 speed=1 direction=round(direction*0.1)*10//direction=startdir//}
    }
}
if path_index>=0 image_speed=path_speed*0.1
if !instance_exists(objPlayer) {alert=0 if speed>1 speed=1 exit}
if alert<2 and alert>0 scrCharge(objPlayer.x,objPlayer.y,10,4)
if alert=2 scrAim(objPlayer.x,objPlayer.y,10,4)
if alert=3 scrChaseSearch(objPlayer.x,objPlayer.y,4)
}
scrMoveSolidOff()


/*

image_speed=speed*0.1
if sprite_index=sprEWalkUnarmed {
scrGoGetWeapon()
} else {
if alert=0 {
scrSearch(objPlayer.x,objPlayer.y,4) 
if alertwait>-1 {if alertwait=0 {path_end() alert=1} alertwait-=1
}
if scrIsSearching(sprite_index) {image_speed=0.2 speed=0 exit}
if path_position=1 {path_end()}
if returning=0 {if speed=0 {speed=1 direction=startdir} scrPatrol()} else {//if point_distance(x,y,startx,starty)>4 scrReturn(path) else {
returning=0 speed=1 direction=round(direction*0.1)*10//direction=startdir//}
}
}
if !instance_exists(objPlayer) {alert=0 if speed>1 speed=1 exit}
if alert<2 and alert>0 scrCharge(objPlayer.x,objPlayer.y,10,4)
if alert=2 scrAim(objPlayer.x,objPlayer.y,10,4)
if alert=3 scrMeleeChaseSearch(objPlayer.x,objPlayer.y,4)
} 
scrMoveSolidOff()
