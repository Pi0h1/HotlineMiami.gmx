if !instance_exists(objPlayer) exit
if reload>0 reload-=1 else {
if point_distance(x,y,objPlayer.x,objPlayer.y)<220 {
if !scrCollisionLineExt(x,y,objPlayer.x,objPlayer.y,3,objSolid,objDoorV,objWallSoftH) {
my_id=instance_create(x,y,objEnemy)
my_id.alert=1
my_id.checkreload=15
if global.enemy=id global.enemy=my_id
instance_destroy()
my_id=instance_create(x,y,objCellPhone)
my_id.direction=random(360)
my_id.speed=2.5
}
}
reload=15
}

if on=1 {
my_id=instance_create(x,y,objEnemy)
my_id.alert=1
my_id.checkreload=15
if global.enemy=id global.enemy=my_id
instance_destroy()
my_id=instance_create(x,y,objCellPhone)
my_id.direction=random(360)
my_id.speed=2.5
}
