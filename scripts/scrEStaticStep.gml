image_speed=speed*0.1
if sprite_index=sprEWalkUnarmed {
scrGoGetWeapon()
} else {
if alert=0 {
scrSearch(objPlayer.x,objPlayer.y,4) 
if alertwait>-1 {if alertwait=0 {path_end() alert=1} alertwait-=1
}
if scrIsSearching(sprite_index) {image_speed=0.2 speed=0 exit}
if point_distance(x,y,startx,starty)>4 {if path_index<0 scrReturn(path)}
}
if path_index>=0 image_speed=path_speed*0.1
if alert<2 and alert>0 scrCharge(objPlayer.x,objPlayer.y,10,4)
if alert=2 scrAim(objPlayer.x,objPlayer.y,10,4)
if alert=3 scrChaseSearch(objPlayer.x,objPlayer.y,4)
} 
scrMoveSolidOff()
