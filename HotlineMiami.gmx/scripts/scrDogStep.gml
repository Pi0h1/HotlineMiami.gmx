image_speed=speed*0.1
if alert=0 {
    if instance_exists(objPlayer) {if global.maskindex=8 nothing=1 else scrDogSearch(objPlayer.x,objPlayer.y,4)}
    if alertwait>0 alertwait=0
    if alertwait>-1 {if alertwait=0 {path_end() alert=1}  alertwait-=1}
    if findwall=0 {if speed=0 {speed=1 direction=round(direction*0.1)*10 findwall=1 turn=0} scrFollowWall()} else {
    speed=1 
    turn=0
    direction=round(direction*0.1)*10
    if abs(frac(direction*(1/90)))>0 direction+=diradd*10
    if !place_free(x+hspeed*8,y+vspeed*8) findwall=0
    }
}
if path_index>=0 image_speed=path_speed*0.1
if !instance_exists(objPlayer) {if alert>0 findwall=1 alert=0 scrMoveSolidOff() exit} 
if alert<2 and alert>0 {scrDogCharge(objPlayer.x,objPlayer.y,10,4)}
if alert=2 {scrDogChase(path,objPlayer.x,objPlayer.y) alert=3}
if alert=3 {if checkreload>0 checkreload-=1 else {checkreload=20 scrDogChaseSearch(objPlayer.x,objPlayer.y,4) if path_index=-1 {findwall=1 alert=0}}}
scrMoveSolidOff()
