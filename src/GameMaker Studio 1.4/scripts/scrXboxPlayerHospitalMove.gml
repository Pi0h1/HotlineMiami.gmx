
if sprite_index=sprPHospitalHeadache nothing=1 else {
var add,up,down,left,right;

up=0
down=0
left=0
right=0


if leftthumb_x(0)>15000  {
right=1
}

if leftthumb_x(0)<-15000 {
left=1
}

if leftthumb_y(0)>10000 {
up=1
}

if leftthumb_y(0)<-10000 {
down=1
}


if up {
myxspeed+=lengthdir_x(0.25,90-view_angle[0])
myyspeed+=lengthdir_y(0.25,90-view_angle[0])
}


if down {
myxspeed+=lengthdir_x(0.25,270-view_angle[0])
myyspeed+=lengthdir_y(0.25,270-view_angle[0])
}

if left {
myxspeed+=lengthdir_x(0.25,180-view_angle[0])
myyspeed+=lengthdir_y(0.25,180-view_angle[0])
}

if right {
myxspeed+=lengthdir_x(0.25,-view_angle[0])
myyspeed+=lengthdir_y(0.25,-view_angle[0])
}

if up+down+left+right=0 {
if myxspeed>0 myxspeed-=0.25 else {
if myxspeed<-0.25 myxspeed+=0.25 else myxspeed=0
}
if myyspeed>0 myyspeed-=0.25 else {
if myyspeed<-0.25 myyspeed+=0.25 else myyspeed=0
}
}

if myxspeed>2+lengthdir_x(0.25,global.dir*3) myxspeed=2+lengthdir_x(0.25,global.dir*3)
if myyspeed>2+lengthdir_y(0.25,global.dir*3) myyspeed=2+lengthdir_y(0.25,global.dir*3)
if myxspeed<-2+lengthdir_x(0.25,global.dir*3) myxspeed=-2+lengthdir_x(0.25,global.dir*3)
if myyspeed<-2+lengthdir_y(0.25,global.dir*3) myyspeed=-2+lengthdir_y(0.25,global.dir*3)

legdir=point_direction(0,0,myxspeed,myyspeed)
add=(abs(myxspeed)+abs(myyspeed))*0.1
if add>0.3 add=0.3


if abs(myxspeed)=0 and abs(myyspeed)=0 legindex=0 else {
legindex+=add
with objDizzy {if dizziness<1.25 dizziness+=0.01 else {
with objPlayer {myxspeed=0 myyspeed=0 legindex=0 image_index=0 audio_play_sound(sndTinnitusHospital,0,false) image_speed=0.15 sprite_index=sprPHospitalHeadache}
}
}
image_index+=(abs(myxspeed)+abs(myyspeed))*0.05
}
scrMoveSolidOn()
if place_free(x+myxspeed,y) x+=myxspeed
if place_free(x,y+myyspeed) y+=myyspeed
scrMoveSolidOff()
}
