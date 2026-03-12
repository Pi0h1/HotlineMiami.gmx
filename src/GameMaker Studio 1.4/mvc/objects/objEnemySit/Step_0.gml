if !instance_exists(objPlayer) or sprite_index=sprEnemyRise exit
if reload>0 reload-=1 else {
if point_distance(x,y,objPlayer.x,objPlayer.y)<220 {
if !scrCollisionLineExt(x,y,objPlayer.x,objPlayer.y,3,objSolid,objDoorV,objWallSoftH) {
if sprite_index=sprEnemySit {
image_index=1
image_speed=0.5
sprite_index=sprEnemyRise
}
}
}
reload=30
}

if on=1 {
if sprite_index=sprEnemySit {
image_index=1
image_speed=0.5
sprite_index=sprEnemyRise
}
}
