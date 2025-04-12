if checkreload>0 checkreload-=1 else {
check=scrLook(argument0,argument1,argument2)
if check=0 {path_end() alert=1 speed=2 direction=point_direction(x,y,argument0,argument1)}
if check<2 and check>0 {
if path_index>=0 nothing=1 else {alert=0 direction=round(direction*0.1)*10 speed=1}
}
if path_position=1 {
path_end()
alert=0
findwall=1
image_index=0 
image_speed=0.2 
sprite_index=scrSearchSprite(sprite_index)
//path_end()
}
if check=2 {scrChase(path,objPlayer.x,objPlayer.y) alert=3}
checkreload=20
}
