exit
with objEnemy instance_destroy()
global.done=1
if global.done=1 {
with objEffector {
instance_create(x,y,objEffectorHouse)
instance_destroy()
}
with objDoorV {
if x=32 {solid=1 image_angle=0}
}
with objGate {
image_index=1
solid=0
}
global.myx=x
global.myy=y
instance_destroy()
instance_create(global.myx,global.myy,objBoss1)
test=objPlayer.persistent
objPlayer.persistent=0
global.loaded=1
scrSaveGame()
//if !instance_exists(objMaskMenu) instance_create(x,y,objCheckpoint)
global.loaded=0
objPlayer.persistent=test
}
