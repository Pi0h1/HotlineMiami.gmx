if checkreload>0 checkreload-=1 else {
checkreload=30
if point_distance(x,y,objPlayer.x,objPlayer.y)<220 {
if !scrCollisionLineExt(x,y,objPlayer.x,objPlayer.y,3,objSolid,objDoorV,objWallSoftH) {
if path_index>-21314241 path_end()
if alert=0 and object_index=objEnemyFat audio_play_sound(sndGrunt,0,false)
if scrCollisionLineExt(x,y,objPlayer.x,objPlayer.y,3,objGlassPanelH,objGlassPanelV,objFurniture) {reload=10 checkreload=30 chasex=objPlayer.x chasey=objPlayer.y alert=2} else alert=1
} else {reload=20 if alert>0 {checkreload=30 if alert=1 scrChasePlayer() if alert=2 scrChaseWall() direction=round(direction*0.1)*10} alert=0}
}
}
