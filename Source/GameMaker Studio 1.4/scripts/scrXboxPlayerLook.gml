if global.controllertype=0 or object_index=objPlayerMouseHouse or object_index=objPlayerHospital or object_index=objPlayerBikerHouse {
if checkbutton(0,getid(9)) or instance_exists(global.enemy) {
return point_direction(x,y,global.mousex,global.mousey)
} else {
if point_distance(0,0,rightthumb_x(0),-rightthumb_y(0))>12000 return point_direction(0,0,rightthumb_x(0),-rightthumb_y(0)) else
{
if abs(myxspeed)+abs(myyspeed)>1 {
return point_direction(0,0,myxspeed,myyspeed)
}
}
return dir
}
} else {
if checkbutton(0,getid(9)) or instance_exists(global.enemy) {
return point_direction(x,y,global.mousex,global.mousey)
} else {
if point_distance(0,0,rightthumb_x(0),-rightthumb_y(0))>12000 return point_direction(0,0,rightthumb_x(0),-rightthumb_y(0)) else return dir
}
}
