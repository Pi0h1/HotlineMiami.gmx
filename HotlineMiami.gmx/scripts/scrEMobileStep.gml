angle=direction
if sprite_index=sprEWalkUnarmed {
scrGoGetWeapon()
} else {
if alert=0 {
    
    if instance_exists(objPlayer) scrSearch(objPlayer.x,objPlayer.y,4)
    if alertwait>-1 {if alertwait=0 {path_end() alert=1} alertwait-=1}
    if scrIsSearching(sprite_index) {image_speed=0.2 speed=0 exit}
    if findwall=0 {if speed=0 {speed=1 direction=round(direction*0.1)*10 findwall=1 turn=0} scrFollowWall()} else {
    speed=1 
    turn=0
    direction=round(direction*0.1)*10
    if abs(frac(direction*(1/90)))>0 direction+=diradd*10
    if !place_free(x+hspeed*8,y+vspeed*8) findwall=0
    }
}
if !instance_exists(objPlayer) {if alert>0 findwall=1 alert=0 exit}
if alert<2 and alert>0 {scrCharge(objPlayer.x,objPlayer.y,10,4)}
if alert=2 {scrAim(objPlayer.x,objPlayer.y,10,4)}
if alert=3 {scrChaseSearch(objPlayer.x,objPlayer.y,4)}
} 
scrMoveSolidOff()
