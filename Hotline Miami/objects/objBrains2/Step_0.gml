dist-=speed
if dist<=0 {
if speed>0 {
my_id=instance_create(x,y,objBloodDrop2)
my_id.direction=direction
speed=0
image_speed=0
my_id.speed=0.1
} else {if wait>0 wait-=1 else {if !instance_exists(objBloodPool) {if global.blood=0 or global.surfaces=1 addToSurface(global.surf2,1)}}}
}
