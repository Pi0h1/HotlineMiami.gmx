if instance_exists(objEnemy) or instance_exists(objSwat) {
if instance_exists(objPlayer) {
with objPlayer {
vdist=point_distance(x,y,room_width/2,room_height/2)
vdir=point_direction(room_width/2,room_height/2,x,y)
view_xview[0]=x+lengthdir_x(vdist*0.2,vdir-180)-view_wview[0]*0.5
view_yview[0]=y+lengthdir_y(vdist*0.2,vdir-180)-view_hview[0]*0.5
view_angle[0]=lengthdir_y(vdist*(1/160),vdir*2)
}
test=objPlayer.persistent
objPlayer.persistent=0
global.loaded=1
game_save(working_directory+"\tempsave.sav")
//if !instance_exists(objMaskMenu) instance_create(x,y,objCheckpoint)
global.loaded=0
objPlayer.persistent=test
}
}
