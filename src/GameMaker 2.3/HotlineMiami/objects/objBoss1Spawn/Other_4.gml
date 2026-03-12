if global.done=1 {
with objEffector {
instance_create(x,y,objEffectorHouse)
instance_destroy()
}
with objDoorV {
if x<80 {solid=1 image_angle=0}
}
with objGate {
image_index=1
solid=0
}
global.myx=x
global.myy=y
instance_destroy()
instance_create(global.myx,global.myy,objBossChair)
instance_create(global.myx+8,global.myy+16,objBoss1)
my_id=instance_create(x-24,y,objBossJacket)
my_id.image_angle=170+random(20)
}
