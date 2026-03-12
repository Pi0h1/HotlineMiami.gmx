if checkreload>0 checkreload-=1 else {
check=scrLook(argument0,argument1,argument2)
image_speed=0.2
if check=0 {path_end() alert=1}
if path_position=1 {
path_end()
alert=0
findwall=1
image_index=0 
image_speed=0.2 
sprite_index=scrSearchSprite(sprite_index)
}
if check=2 {alert=2 path_end()}
checkreload=20
}
