if !place_meeting(x,y,objEnemy) solid=1

if global.done=1 exit
if visible=1 {
global.test=0 
with objSubwayDoor {if on=2 global.test=1}
if global.test=1 {
if instance_exists(objEnemy) or instance_exists(objKnockedOut) or instance_exists(objBoss) or instance_exists(objESubwayStatic) nothing=1 else {
global.done=1
instance_create(x,y,objCheckpoint)
}
}
}
