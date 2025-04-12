path_end()
if mp_grid_path(global.grid,path,x,y,chasex-8+random(16),chasey-8+random(16),1)>0 {path_start(path,2,0,1) speed=0} else {direction=round(direction*0.1)*10}
