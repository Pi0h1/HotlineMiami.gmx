exit
xview=camera_get_view_x(view_camera[0])
yview=camera_get_view_y(view_camera[0])
if persistent=1 {
if place_free(x+addx,y) x+=addx
if place_free(x,y+addy) y+=addy
if image_speed=0 image_index+=0.15
legindex+=0.4
exit 
}
if throwreload>0 throwreload-=1
if checkbutton(0,getid(8)) or checkbutton(0,getid(9)) {
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(96,dir),y+lengthdir_y(96,dir))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(96,dir),y+lengthdir_y(96,dir))
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
vdist=point_distance(x,y,room_width/2,room_height/2)
vdir=point_direction(room_width/2,room_height/2,x,y)
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
} else {
vdist=point_distance(x,y,room_width/2,room_height/2)
vdir=point_direction(room_width/2,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}

if sprite_index=sprPAttackKnife or sprite_index=sprPAttackBat or sprite_index=sprPAttackPipe or sprite_index=sprPAttackClub or sprite_index=sprPAttackSword {
lastx=x
lasty=y
x+=lengthdir_x(24,dir)
y+=lengthdir_y(24,dir)

global.my_id=id
with objGlassPanelH {
if place_meeting(x,y,global.my_id) {
if global.my_id.lasty<y+2 {
add=-1
} else {
add=1
}
i=0
repeat (24) {
my_id=instance_create(x+i*1.5,y,objShard)
my_id.speed=random(5)
my_id.direction=add*90-8+random(16)
i+=1
}
instance_create(x,y,objGlassPanelHBroken)
instance_destroy()
audio_play_sound(sndGlass1,0,false)
audio_play_sound(sndGlass2,0,false)
audio_play_sound(sndWeaponHit,0,false)
}
}


with objEnemy {
if place_meeting(x,y,objPlayer) {
mask_index=sprWeaponMask 
if scrCollisionLineExt(x,y,objPlayer.lastx,objPlayer.lasty,4,objSolid,objWallSoftH,objDoorV) {mask_index=sprMask objPlayer.x=objPlayer.lastx objPlayer.y=objPlayer.lasty exit}
mask_index=sprMask
my_id=instance_create(x,y-12,objScore)
if sprite_index=sprEWalkUnarmed {
my_id.text="+"+string((100)*global.factor)+"pts" 
global.myscore+=(100)*global.factor
} else {
my_id.text="+"+string((400)*global.factor)+"pts"
global.myscore+=(400)*global.factor
}
edir=point_direction(objPlayer.lastx,objPlayer.lasty,x,y)
repeat (8) {
my_id=instance_create(x-3+random(6)+lengthdir_x(8,edir),y-3+random(6)+lengthdir_y(8,edir),objBloodDrop)
my_id.image_xscale=1-random(0.2)
my_id.image_yscale=my_id.image_xscale
my_id.image_angle=point_direction(x+lengthdir_x(8,edir),y+lengthdir_y(8,edir),my_id.x,my_id.y)
my_id.sprite_index=sprBloodSplatSmall
my_id.direction=my_id.image_angle
my_id.speed=2+random(4)
}
repeat (2+random(3)) {
my_id=instance_create(x-3+random(6)+lengthdir_x(8,edir),y-3+random(6)+lengthdir_y(8,edir),objBloodDrop)
my_id.image_xscale=1-random(0.2)
my_id.image_yscale=my_id.image_xscale
my_id.image_angle=point_direction(x+lengthdir_x(8,edir),y+lengthdir_y(8,edir),my_id.x,my_id.y)
my_id.direction=my_id.image_angle
my_id.speed=1+random(5)
}
repeat (4) {
my_id=instance_create(x-3+random(6)+lengthdir_x(16,edir),y-3+random(6)+lengthdir_y(16,edir),objBloodSmoke)
my_id.image_xscale=1.2-random(0.2)
my_id.image_yscale=my_id.image_xscale
my_id.image_angle=edir-20+random(40)
my_id.direction=my_id.image_angle
my_id.speed=2+random(1)
my_id.friction=0.15
}
my_id=instance_create(x,y,objDeadBody)
if object_index=objDogPatrol {
if objPlayer.sprite_index=sprPAttackClub or objPlayer.sprite_index=sprPAttackBat or objPlayer.sprite_index=sprPAttackPipe {audio_play_sound(sndHit,0,false) my_id.sprite_index=sprDogDeadBlunt my_id.image_index=3+floor(random(3))} else {my_id.sprite_index=sprDogDeadCut audio_play_sound(choose(sndCut1,sndCut2),0,false) my_id.image_index=4+floor(random(3))}
} else {
if objPlayer.sprite_index=sprPAttackClub or objPlayer.sprite_index=sprPAttackBat or objPlayer.sprite_index=sprPAttackPipe {audio_play_sound(sndHit,0,false) my_id.sprite_index=sprEBackBlunt my_id.image_index=4+floor(random(11))} 
if objPlayer.sprite_index=sprPAttackKnife {my_id.sprite_index=sprEBackCut audio_play_sound(choose(sndCut1,sndCut2),0,false) my_id.image_index=2+floor(random(3))}
if objPlayer.sprite_index=sprPAttackSword {
my_id.sprite_index=sprEBackSlashed 
audio_play_sound(choose(sndCut1,sndCut2),0,false) 
audio_play_sound(sndHit,0,false) 
my_id.image_index=floor(random(4))
if my_id.image_index=0 {
part=instance_create(my_id.x+lengthdir_x(22,edir),my_id.y+lengthdir_y(18,edir),objBodyPart)
part.image_angle=edir-10+random(20)
part.direction=part.image_angle
part.speed=3+random(1)
}
if my_id.image_index=1 {
part=instance_create(my_id.x+lengthdir_x(12,edir),my_id.y+lengthdir_y(8,edir),objBodyPart)
part.image_angle=edir-10+random(20)
part.direction=part.image_angle
part.speed=3+random(1)
part.image_index=1
part.image_yscale=my_id.image_yscale
}
if my_id.image_index=2 {
part=instance_create(my_id.x+lengthdir_x(16,edir),my_id.y+lengthdir_y(12,edir),objBodyPart)
part.image_angle=edir-10+random(20)
part.direction=part.image_angle
part.speed=3+random(1)
part.image_index=2
part.image_yscale=my_id.image_yscale
}
}
}

my_id.direction=edir
my_id.speed=1.5+random(1)
my_id.image_angle=my_id.direction
if sprite_index=sprEWalkUnarmed or object_index=objDogPatrol noweapon=1 else noweapon=0
if noweapon=0 {
my_id=instance_create(x,y,objWeaponThrow)
my_id.direction=other.direction-70+random(40)
my_id.speed=2+random(2)
my_id.image_index=scrCurrentWeaponExt(sprite_index)
my_id.ammo=ammo
}

instance_destroy()
}
}
x=lastx
y=lasty
}



if sprite_index=sprPAttackPunch {
lastx=x
lasty=y
x+=lengthdir_x(12,dir)
y+=lengthdir_y(12,dir)


global.my_id=id
with objGlassPanelH {
if place_meeting(x,y,global.my_id) {
if global.my_id.lasty<y+2 {
add=-1
} else {
add=1
}
i=0
repeat (24) {
my_id=instance_create(x+i*1.5,y,objShard)
my_id.speed=random(5)
my_id.direction=add*90-8+random(16)
i+=1
}
instance_create(x,y,objGlassPanelHBroken)
instance_destroy()
audio_play_sound(sndGlass1,0,false)
audio_play_sound(sndGlass2,0,false)
audio_play_sound(sndWeaponHit,0,false)
}
}

with objEnemy {
if object_index=objDogPatrol valid=0 else valid=1
if place_meeting(x,y,objPlayer) and valid=1 {
mask_index=sprWeaponMask 
if scrCollisionLineExt(x,y,objPlayer.lastx,objPlayer.lasty,4,objSolid,objWallSoftH,objDoorV)  {mask_index=sprMask objPlayer.x=objPlayer.lastx objPlayer.y=objPlayer.lasty exit}
mask_index=sprMask
edir=point_direction(objPlayer.lastx,objPlayer.lasty,x,y)
audio_play_sound(sndDoorHit,0,false)
my_id=instance_create(x,y,objKnockedOut)
my_id.type=object_index
my_id.direction=edir-10+random(20)
my_id.angle=my_id.direction
with my_id move_outside_solid(angle-180,16)
my_id.speed=3
if sprite_index=sprEWalkUnarmed noweapon=1 else noweapon=0
if noweapon=0 {
global.test=0
with objEnemy if alert=1 global.test+=1
my_id=instance_create(x,y-12,objScore)
my_id.text="+"+string((300+200*global.test)*global.factor)+"pts"
global.myscore+=(300+200*global.test)*global.factor
my_id=instance_create(x,y,objWeaponThrow)
my_id.direction=direction-70+random(40)
my_id.image_index=scrCurrentWeaponExt(sprite_index)
my_id.speed=2+random(2)
my_id.ammo=ammo
}
instance_destroy()
}
}
x=lastx
y=lasty
}

