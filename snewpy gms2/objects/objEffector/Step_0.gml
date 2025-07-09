if global.xbox=1 {
if checkbutton(0,getid(5)) {
if presstart=0 {
presstart=1
scrXboxEffectorStart()
} 
} else presstart=0

if checkbutton(0,getid(6)) {
if pressback=0 {
pressback=1
scrXboxEffectorPause()
} 
} else pressback=0
}
if uzisnd=1 {
uzisnd=0
audio_play_sound(sndUzi,0,false)
}
if keyboard_check_pressed(ord(global.restartkey)) event_perform(ev_keypress,ord("R"))
SteamRunCallbacks()
if global.maskload=1 {
scrLoadMask()
global.maskload=0
with objPlayer scrGetMaskPowers()
}

if global.loaded=1 {
scrLoadAchievements()
if room=rmSwatUpstairs {
audio_stop_sound(sndPolice)
if file_exists(working_directory+"\\restartmusic") {
sxeasy_play(working_directory+"\\Crystals.mp3")
sxeasy_setVolume(1)
file_delete(working_directory+"\\restartmusic")
scrCheckpoint()
}
}
scrLoadBonusList()
with objSurfacer {
scrSurfaceTiles()
}
with objWeapon {
if object_index=objSpecificWeapon nothing=1 else {
instance_create(x,y,objWeapon)
instance_destroy()
}
}
leveltitle=""
levelshow=120
global.loaded=0
//scrSaveTiles()
if global.maskindex=9 objPlayer.energie=1
if global.maskindex=21 objPlayer.energie=2
}
//if wait=0 {vcapture_frame() wait=1} else wait=0
scrCheckMissionComplete()
if global.controller=1 {
if checkbutton(0,getid(5)) fade=1
}



if fade=0 {
if amount<180 {
amount+=5
}
}

if fade=1 {
if amount>0  {
amount-=10
if restart=1 or newsong=1 or (room=rmSwatUpstairs and instance_exists(objSwat) and instance_exists(objPlayerDead)) {
sxeasy_setVolume(amount*(1/180))
}
} else {fade=0 if restart=1 {if file_exists(working_directory+"\\restartmusic") file_delete(working_directory+"\\restartmusic") sxeasy_stop(1) sxeasy_setVolume(0) bgm_Close() game_restart() //sxeasy_play(working_directory+"\HorseSteppin.mp3"); room=rmMenu
} else {if next=1 {if file_exists(working_directory+"\\restartmusic") file_delete(working_directory+"\\restartmusic") if newsong=1 {sxeasy_stop(1) sxeasy_setVolume(0) sxeasy_play(song);} room=nextroom} else {if room=rmSwatUpstairs and file_exists(working_directory+"\\restarmusic") {sxeasy_stop(1) bgm_Unload(global.currentsong)} scrRestart()}}}
}



/*surface_set_target(global.surf4)
draw_clear_alpha(c_black,0)
scrScoreDraw()
surface_reset_target()*/
vlastx=camera_get_view_x(view_camera[0])
vlasty=camera_get_view_y(view_camera[0])
if global.shake>0 {
global.shake-=0.5
if global.xbox=1 setrumble(0,0,global.shake*(1/15)*65535)
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (-global.shake*0.33+random(global.shake*0.66)), camera_get_view_y(view_camera[0]) + (-global.shake*0.33+random(global.shake*0.66)));
}

/* */
/*  */
