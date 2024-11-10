if global.godmode=1 exit
with objPlayer {
PlaySFX(sndDogAttack)
pdir=point_direction(global.my_id.x,global.my_id.y,x,y)
createBlood(pdir)
player=createDeadBody(true,2.5,sprPBackEaten,pdir)
master=player
my_id=instance_create(master.x,master.y,objDogBite)
my_id.image_angle=master.image_angle
my_id.master=master
my_id=instance_create(x,y,objKnockedOut)
global.dir=dir
with my_id move_contact_solid(global.dir-45,12)
my_id.direction=dir
my_id.angle=my_id.direction
my_id.speed=2+random(1)
my_id.image_angle=my_id.direction
my_id.ammo=ammo
my_id.type=objEnemy
instance_destroy()
}
