previousx=x
previousy=y
if sprite_index=sprPHeadExplode { exit}
if room=rmSequence13Downstairs {
if active=0 {if y>224 {y-=2 image_index+=0.2 legindex+=0.3} else active=1}
if sprite_index=sprPWalkUnarmed {with objBackgroundColorClear {instance_create(x,y,objBackgroundColor) instance_destroy()}}
}
if global.xbox=1 scrXboxPlayerMouseHouse()

global.test=0
with objWeapon {if point_distance(x,y,objPlayer.x,objPlayer.y)<32 global.test=2}
if place_meeting(x,y,objKnockedOut) global.test=1
objEffector.action=global.test
if throwreload>0 throwreload-=1
if instance_exists(objPhoneConversation) valid=0 else valid=1
if global.xbox=0 aimfar=keyboard_check_direct(vk_shift) else aimfar=checkbutton(0,getid(9))
factor=1
if aimfar and valid {
/*viewspeed=point_distance(view_xview[0]+view_wview[0]/2,view_yview[0]+view_hview[0]/2,x+lengthdir_x(96,dir),y+lengthdir_y(96,dir))*0.1
viewdir=point_direction(view_xview[0]+view_wview[0]/2,view_yview[0]+view_hview[0]/2,x+lengthdir_x(96,dir),y+lengthdir_y(96,dir))
view_xview[0]+=lengthdir_x(viewspeed,viewdir)
view_yview[0]+=lengthdir_y(viewspeed,viewdir)*/

if global.xbox=1 {
viewx=objPlayer.x+rightthumb_x(0)*0.0045
viewy=objPlayer.y-rightthumb_y(0)*0.003
} else {
viewx=objPlayer.x+((display_mouse_get_x()-display_get_width()*0.5)*(camera_get_view_width(view_camera[0])/display_get_width()))*factor
viewy=objPlayer.y+((display_mouse_get_y()-display_get_height()*0.5)*(camera_get_view_height(view_camera[0])/display_get_height()))*factor
}

viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,viewx,viewy)*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,viewx,viewy)
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
vdist=point_distance(x,y,room_width/2,room_height/2)
vdir=point_direction(room_width/2,room_height/2,x,y)
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
} else {
if objPlayer.active=0 and (instance_exists(objPhoneConversation) or instance_exists(objFocus)) {
if instance_exists(objLightingEngine) or instance_exists(objTutorialLight) {
with objLight {
if targetstrength=1 {
valid=0
vdist=point_distance(x,y,room_width/2-(1-valid)*88,room_height/2)
vdir=point_direction(room_width/2-(1-valid)*88,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}
}
}

with objBoss1 {
valid=0
vdist=point_distance(x,y,room_width/2-(1-valid)*88,room_height/2)
vdir=point_direction(room_width/2-(1-valid)*88,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180)-32)*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180)-32)
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}

with objBoss1Down {
valid=0
vdist=point_distance(x,y,room_width/2-(1-valid)*88,room_height/2)
vdir=point_direction(room_width/2-(1-valid)*88,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180)-32)*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180)-32)
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}

with objClubOwner {
valid=0
vdist=point_distance(x,y,room_width/2-(1-valid)*88,room_height/2)
vdir=point_direction(room_width/2-(1-valid)*88,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180)-32)*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180)-32)
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}

with objOldman {
valid=0
vdist=point_distance(x,y,room_width/2-(1-valid)*88,room_height/2)
vdir=point_direction(room_width/2-(1-valid)*88,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}

global.test=0
with objLight {if targetstrength=1 global.test=1}
if global.test=0 {
with objTutorialHobo {
valid=0
vdist=point_distance(x,y,room_width/2-(1-valid)*88,room_height/2)
vdir=point_direction(room_width/2-(1-valid)*88,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}
}

with objBoss4 {
if state=2 or state=4 or state=6 {
valid=0
vdist=point_distance(x,y,room_width/2-(1-valid)*88,room_height/2)
vdir=point_direction(room_width/2-(1-valid)*88,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}
}

with objBodyguard {
if state=2 {
valid=0
vdist=point_distance(x,y,room_width/2-(1-valid)*88,room_height/2)
vdir=point_direction(room_width/2-(1-valid)*88,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}
}

with objDeadTable {
if global.talked=2 {
valid=0
vdist=point_distance(x,y,room_width/2-(1-valid)*88,room_height/2)
vdir=point_direction(room_width/2-(1-valid)*88,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}
}

with objBoss3Kneel {
valid=0
vdist=point_distance(x,y,room_width/2-(1-valid)*88,room_height/2)
vdir=point_direction(room_width/2-(1-valid)*88,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}

with objDreamPlayer {
valid=0
vdist=point_distance(x,y,room_width/2-(1-valid)*88,room_height/2)
vdir=point_direction(room_width/2-(1-valid)*88,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}

with objAssassinSitUzi {
valid=0
vdist=point_distance(x,y,room_width/2-(1-valid)*88,room_height/2)
vdir=point_direction(room_width/2-(1-valid)*88,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}

with objSacrifice {
valid=0
vdist=point_distance(x,y,room_width/2-(1-valid)*88,room_height/2)
vdir=point_direction(room_width/2-(1-valid)*88,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}

with objChief {
if global.locked=1 {
valid=0
vdist=point_distance(x,y,room_width/2-(1-valid)*88,room_height/2)
vdir=point_direction(room_width/2-(1-valid)*88,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}
}

with objPrisoner {
if global.locked=0 {
valid=0
vdist=point_distance(x,y,room_width/2-(1-valid)*88,room_height/2)
vdir=point_direction(room_width/2-(1-valid)*88,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}
}

if room=rmStore3 {

with objBoss2Corpse {
if state=1 {
valid=0
vdist=point_distance(x,y,room_width/2-(1-valid)*88,room_height/2)
vdir=point_direction(room_width/2-(1-valid)*88,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}
}

with objPlayerMouseHouse {
test=1
if instance_exists(objBoss2Corpse) {
if objBoss2Corpse.state==1 test=0
}
if test {
valid=0
vdist=point_distance(x,y,room_width/2-(1-valid)*88,room_height/2)
vdir=point_direction(room_width/2-(1-valid)*88,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}
}

}

with objHobo {
valid=0
vdist=point_distance(x,y,room_width/2-(1-valid)*88,room_height/2)
vdir=point_direction(room_width/2-(1-valid)*88,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}

with objBoss2Crawl {
valid=0
vdist=point_distance(x,y,room_width/2-(1-valid)*88,room_height/2)
vdir=point_direction(room_width/2-(1-valid)*88,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}

with objGirlfriend {
if active=1 {
valid=0
vdist=point_distance(x,y,room_width/2-(1-valid)*88,room_height/2)
vdir=point_direction(room_width/2-(1-valid)*88,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}
}

with objBoss2 {
valid=0
vdist=point_distance(x,y,room_width/2-(1-valid)*88,room_height/2)
vdir=point_direction(room_width/2-(1-valid)*88,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}

} else {
if active=1 or (!instance_exists(objPhone) and !instance_exists(objBoss4) and !instance_exists(objBossPhone) and !instance_exists(objTrain)) or instance_exists(objBodyguard) and !instance_exists(objPicture) {
vdist=point_distance(x,y,room_width/2-(1-valid)*88,room_height/2)
vdir=point_direction(room_width/2-(1-valid)*88,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
} else {
with objPhone {
valid=0 
vdist=point_distance(x,y,room_width/2-(1-valid)*88,room_height/2)
vdir=point_direction(room_width/2-(1-valid)*88,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}

with objBossPhone {
valid=0 
vdist=point_distance(x,y,room_width/2-(1-valid)*88,room_height/2)
vdir=point_direction(room_width/2-(1-valid)*88,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}

with objTrain {
if visible=1 {
valid=0 
vdist=point_distance(x,y,room_width/2-(1-valid)*88,room_height/2)
vdir=point_direction(room_width/2-(1-valid)*88,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}
}

with objPicture {
valid=0 
vdist=point_distance(x,y,room_width/2,room_height/2)
vdir=point_direction(room_width/2,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x,y)*0.2
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x,y)
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}

with objBoss4 {
valid=0 
vdist=point_distance(x,y,room_width/2-(1-valid)*88,room_height/2)
vdir=point_direction(room_width/2-(1-valid)*88,room_height/2,x,y)
viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))*0.1
viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2-(1-valid)*88,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(vdist*0.2,vdir-180),y+lengthdir_y(vdist*0.2,vdir-180))
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
}

}
}
}
xview=camera_get_view_x(view_camera[0])
yview=camera_get_view_y(view_camera[0])
if persistent=1 and objEffector.fade=1 {
if place_free(x+addx,y) x+=addx
if place_free(x,y+addy) y+=addy
if image_speed=0 image_index+=0.15
legindex+=0.4
exit 
}

if active=1 scrPlayerMoveKeyboard()

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
if scrCollisionLineExt(x,y,objPlayer.lastx,objPlayer.lasty,4,objSolid,objDoorV,objWallSoftH) {mask_index=sprMask objPlayer.x=objPlayer.lastx objPlayer.y=objPlayer.lasty exit}
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
if scrCollisionLineExt(x,y,objPlayer.lastx,objPlayer.lasty,4,objSolid,objDoorV,objWallSoftH) {mask_index=sprMask objPlayer.x=objPlayer.lastx objPlayer.y=objPlayer.lasty exit}
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

/* */
/*  */