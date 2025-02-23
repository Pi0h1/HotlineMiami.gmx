if global.godmode=1 exit
with objPlayer {
PlaySFX(sndDogAttack)
pdir=point_direction(global.my_id.x,global.my_id.y,x,y)
createBlood(pdir)
player=createDeadBody(true,2.5,sprPBackEaten,pdir)
master=player
my_id=instance_create(master.x,master.y,objPantherBite)
my_id.image_angle=master.image_angle
my_id.master=master
if object_get_parent(object_index)=objExecution {
my_id=instance_create(x,y,objKnockedOut)
my_id.angle=image_angle
my_id.type=objEnemy
}
instance_destroy()
}
