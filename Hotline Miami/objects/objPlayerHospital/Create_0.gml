if global.xbox=1 scrInitXboxButtons()
image_speed=0
currentweapon=0
dir=0
viewspeed=0
reload=0
light=0
legdir=0
legindex=0
left=1
ammo=0
energie=1
throwreload=0
if global.controller=1 {instance_create(x,y,objPlayerController) instance_destroy()}
active=1
myxspeed=0
myyspeed=0
myspeed=0
last_sprite=sprPWalkHospital
__view_set( e__VW.XView, 0, x-__view_get( e__VW.WView, 0 )/2 )
__view_set( e__VW.YView, 0, y-__view_get( e__VW.HView, 0 )/2 )
xview=camera_get_view_x(view_camera[0])
yview=camera_get_view_y(view_camera[0])
alarm[1]=2
