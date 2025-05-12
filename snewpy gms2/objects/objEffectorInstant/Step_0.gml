//if wait=0 {vcapture_frame() wait=1} else wait=0
if !instance_exists(objEnemy) and !instance_exists(objEnemyBash) and !instance_exists(objKnockedOut) global.done=1
if global.controller=1 {
if checkbutton(0,getid(5)) fade=1
}

/*surface_set_target(global.surf4)
draw_clear_alpha(c_black,0)
scrScoreDraw()
surface_reset_target()*/
/* */
/*  */
