if checkreload>0 checkreload-=1 else {
if point_distance(x,y,objPlayer.x,objPlayer.y)<220 {
if !scrCollisionLineExt(x,y,objPlayer.x,objPlayer.y,3,objSolid,objDoorV,objWallSoftH) {
if path_index>-21314241 path_end()
alert=1
} else {reload=20 if alert>0 {checkreload=30 if alert=1 scrChasePlayer() if alert=2 scrChaseWall()} alert=0}
}
checkreload=30
}
