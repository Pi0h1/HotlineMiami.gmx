SteamRunCallbacks()
if global.loaded=1 {
with objSurfacer {
scrSurfaceTiles()
}
with objWeapon {
if object_index=objSpecificWeapon nothing=1 else {
instance_create(x,y,objWeapon)
instance_destroy()
}
}
global.loaded=0
scrSaveTiles()
}

//if wait=0 {vcapture_frame() wait=1} else wait=0
if global.xbox=1 {
if checkbutton(0,getid(6)) {
if pressback=0 {
pressback=1
scrXboxEffectorHousePause()
} 
} else pressback=0
}


if save=1 {
save=0
test=objPlayer.persistent
objPlayer.persistent=0
global.loaded=1
scrSaveGame()
global.loaded=0
objPlayer.persistent=test
}

/*surface_set_target(global.surf4)
draw_clear_alpha(c_black,0)
scrScoreDraw()
surface_reset_target()*/
/* */
/*  */
