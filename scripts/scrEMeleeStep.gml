angle=direction
if sprite_index=sprEWalkUnarmed {
scrGoGetWeapon()
alert=0
} else {
if alert=0 {
    if instance_exists(objPlayer) scrMeleeSearch(objPlayer.x,objPlayer.y,4)
    if alertwait>-1 {alertwait-=1 if alertwait=0 {path_end() alert=1}}
    if scrIsSearching(sprite_index) {image_speed=0.2*delta speed=0}
    if scrEnemyIsAttacking(sprite_index) {image_speed=1*delta}
    if returning=0 {speed=1 direction=round(direction*0.1)*10 scrPatrol()} else {//if point_distance(x,y,startx,starty)>4 scrReturn(path) else {
    returning=0 speed=1 direction=round(direction*0.1)*10//direction=startdir//}
    }
}
if !instance_exists(objPlayer) {alertwait=-1*delta alert=0 scrMoveSolidOff() exit}
if alert<2 and alert>0 {
scrAttack(objPlayer.x,objPlayer.y,10,4)
if reload>0 reload-=1 else {
if point_distance(x,y,objPlayer.x,objPlayer.y)<18 {
if scrIsSearching(sprite_index) sprite_index=scrStopSearch(sprite_index)
PlaySFX(choose(sndSwing1,sndSwing2))
sprite_index=scrGetAttack(sprite_index)
image_index=1
image_speed=1
reload=30
}
}
}

}

if alert=2 {scrChase(path,objPlayer.x,objPlayer.y) alert=3}
if alert=3 { scrMeleeChaseSearch(objPlayer.x,objPlayer.y,4)}
scrMoveSolidOff()

if speed>0 image_speed=(speed*0.1)*delta
if path_index>=0 image_speed=(path_speed*0.1)*delta
