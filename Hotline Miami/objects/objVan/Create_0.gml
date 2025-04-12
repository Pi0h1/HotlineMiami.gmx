global.done=0
state=0
image_speed=0
vspeed=12
with objDoorH image_angle=0
with objDoorH2 image_angle=0
image_angle=270
image_yscale=2
audio_play_sound(sndCarThrottle,0,false)
brake=0
sxeasy_play(working_directory+"\\Release.mp3")
doorangle=0
reload=0
enemies=5
headdir=90
molotovs=2
with objEffector {
viewx=camera_get_view_x(view_camera[0])
viewy=camera_get_view_y(view_camera[0])
instance_create(x,y,objEffectorHouse)
__view_set( e__VW.XView, 0, viewx )
__view_set( e__VW.YView, 0, viewy )
instance_destroy()
}

test=objPlayer.persistent
objPlayer.persistent=0
thrown=0
global.loaded=1
objEffectorHouse.amount=0
scrSaveGame()
global.loaded=0
objEffectorHouse.amount=180
objPlayer.persistent=test

