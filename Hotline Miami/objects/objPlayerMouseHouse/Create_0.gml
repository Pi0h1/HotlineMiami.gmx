if global.xbox=1 scrInitXboxButtons()
image_speed=0
currentweapon=0
dir=0
aimon=1
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
scrInitThrowPos()
scrInitMaskPos()
throwindex=0
alarm[0]=18
last_sprite=sprite_index
maskon=0
maskindex=0
previousx=x
previousy=y
active=1
if room=rmSequence13Downstairs active=0
myxspeed=0
myyspeed=0
myspeed=0

if room=rmSecretSewer {
maskon=1
maskindex=global.maskindex
global.maskon=1
}
