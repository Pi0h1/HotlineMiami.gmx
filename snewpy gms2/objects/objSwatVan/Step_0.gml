if global.done=1 {
if spawn=0 {
my_id=instance_create(248,120,objSwat)
my_id.direction=180
my_id.diradd=1
my_id=instance_create(352,120,objSwat)
my_id.direction=0
my_id.diradd=-1
my_id=instance_create(280,528,objSwat)
my_id.direction=90
my_id.diradd=-1
my_id=instance_create(336,528,objSwat)
my_id.direction=90
my_id.diradd=1
visible=1
solid=1
spawn=1
with objCopCar {visible=1 solid=1}
scrCheckpoint()
}
}
