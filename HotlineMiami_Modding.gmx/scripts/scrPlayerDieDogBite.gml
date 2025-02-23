if global.godmode=1 exit
ductTape=instance_create(-64,-64,objEnemyCrawl); // If this object doesn't exist sometimes the gamme will crash, this is a quick fix while I look for a better solution.
ductTape.visible=0;
with objPlayer {
PlaySFX(sndDogAttack)
pdir=point_direction(global.my_id.x,global.my_id.y,x,y)
createBlood(pdir)
player=createDeadBody(true,2.5,sprPBackEaten,pdir)     
my_id=instance_create(player.x,player.y,objDogBite)
my_id.image_angle=player.image_angle
my_id.master=player
if object_get_parent(object_index)=objExecution {
my_id=instance_create(x,y,objKnockedOut)
my_id.angle=image_angle
my_id.type=objEnemy
}
instance_destroy();
}
with ductTape {instance_destroy();}
