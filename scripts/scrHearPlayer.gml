global.list=ds_list_create()

with objEnemy {
if object_get_parent(object_index)=objEnemyIdle {if room=rmHotelEntrance or room=rmHotelSuite on=1}
if object_index=objEnemyStationary or object_get_parent(object_index)=objEnemyIdle or object_index=objChief valid=0 else {
if alert>0 valid=0 else {
if global.maskindex=12 dist=100 else dist=300
if point_distance(x,y,objPlayer.x,objPlayer.y)>dist valid=0 else {
if sprite_index=sprEWalkUnarmed or sprite_index=sprEGiveUp valid=0 else {
targetx=objPlayer.x-64+random(128)
targety=objPlayer.y-64+random(128)
while collision_line(objPlayer.x,objPlayer.y,targetx,targety,objSolid,1,1) {
targetx=objPlayer.x-64+random(128)
targety=objPlayer.y-64+random(128)
}
if mp_grid_path(global.grid,path,x,y,targetx,targety,1) valid=1 else valid=0
}
}
}
}
}

with objEnemy {
if path_exists(path) and valid=1 {
ds_list_add(global.list,path_get_length(path))
}
}

ds_list_sort(global.list,1)
while ds_list_size(global.list)>3 ds_list_delete(global.list,3)

global.test=0
with objEnemy {
if valid=1 {
if ds_list_find_value(global.list,0)=path_get_length(path) or ds_list_find_value(global.list,1)=path_get_length(path) or ds_list_find_value(global.list,2)=path_get_length(path) {
if global.test<3 {
if alert=1 nothing=1 else {
path_end()
path_start(path,2,0,1)
alert=2
}
}
global.test+=1
}
}
}

/*


with objEnemy {
if object_index=objEnemyStationary or object_get_parent(object_index)=objEnemyIdle or alert>0 valid=0 else {
if point_distance(x,y,objPlayer.x,objPlayer.y)>300 valid=0 else {
path_end()
targetx=objPlayer.x-64+random(128)
targety=objPlayer.y-64+random(128)
while collision_line(objPlayer.x,objPlayer.y,targetx,targety,objSolid,1,1) {
targetx=objPlayer.x-64+random(128)
targety=objPlayer.y-64+random(128)
}
if mp_grid_path(global.grid,path,x,y,targetx,targety,1) valid=1 else valid=0
}
}
}



with objEnemy {
if path_exists(path) and valid=1 and alert=0 {
ds_list_add(global.list,path_get_length(path))
}
}

ds_list_sort(global.list,1)
while ds_list_size(global.list)>3 ds_list_delete(global.list,3)
global.test=0
with objEnemy {
if ds_list_find_value(global.list,0)=path_get_length(path) or ds_list_find_value(global.list,1)=path_get_length(path) or ds_list_find_value(global.list,2)=path_get_length(path) {
if global.test<3 {
path_start(path,2,0,1)
alert=2
global.test+=1
}
}
}


ds_list_destroy(global.list)
