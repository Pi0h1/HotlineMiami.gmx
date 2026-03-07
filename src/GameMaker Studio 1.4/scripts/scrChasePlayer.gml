if instance_exists(objPlayer) {
path_end()
if mp_grid_path(global.grid,path,x,y,objPlayer.x-32+random(64),objPlayer.y-32+random(64),1)>0 {path_start(path,2,0,1) speed=0} else {direction=round(direction*0.1)*10}
}
