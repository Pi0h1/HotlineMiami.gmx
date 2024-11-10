//if path_index>=0 path_end()
image_xscale=0.5
image_yscale=0.5
if !mp_grid_path(global.grid,argument0,x,y,startx,starty,1) {path_end() findwall=1 alert=0} else {
path_start(argument0,2,0,1)
}
image_xscale=1
image_yscale=1
//return path_index
