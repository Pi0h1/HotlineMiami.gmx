if global.done=1 exit
if place_meeting(x+4,y,objPlayerBikerHouse) {
if objPlayerBikerHouse.y>y+74 and objPlayerBikerHouse.y<y+82 {
enter=1
with objPlayerBikerHouse {
my_id=instance_create(objManhole.x+95,objManhole.y+78,objBikerClimbDown)
my_id.image_angle=dir
instance_destroy()
}
}
}
