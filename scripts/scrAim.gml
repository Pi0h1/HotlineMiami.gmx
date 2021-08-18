var dist;
if ammo>0 {
dist=point_distance(x,y,argument[0],argument[1])
if dist>280 scrChase(path,objPlayer.x,objPlayer.y) else {
speed=0
if dist>80 angle=point_direction(x,y,objPlayer.x,objPlayer.y) else angle=scrRotate(angle,point_direction(x,y,argument[0],argument[1]),10)
direction=angle
if reload>0 reload-=1 else {
if scrIsSearching(sprite_index) sprite_index=scrStopSearch(sprite_index)
scrEnemyShoot()
}
scrChargeSearch(objPlayer.x,objPlayer.y,4)
}
}
