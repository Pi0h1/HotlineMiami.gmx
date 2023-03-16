if instance_exists(objMaskMenu) or instance_exists(objPhoneConversation) nothing=1 else {
global.test=0
with objElevator if touch=1 global.test=1 
if persistent=1 and global.test=1 nothing=1 else {
myspeed=3
factor=1

if object_index=objPlayerBiker {myspeed=3.5 factor=1}
if global.maskindex=5 and global.maskon=1 {myspeed=3.5 factor=1}
if global.maskindex=16 and global.maskon=1 myspeed=4
if place_meeting(x,y,objShadowH) or place_meeting(x,y,objShadowV) {myspeed=2.25 factor=1.35}
if sprite_index=sprPWalkGirlfriend myspeed=1.5
if sprite_index=sprPWalkHospital myspeed=2
if object_index=objPlayerHospital  {factor=2 myspeed=1.5}

if global.maskindex=20 {
if leftthumb_x(0)>15000  {
if myxspeed>-(myspeed) myxspeed-=0.5 else myxspeed=-(myspeed)
}

if leftthumb_x(0)<-15000 {
if myxspeed<(myspeed) myxspeed+=0.5 else myxspeed=(myspeed)
}

if leftthumb_y(0)<-10000 {
if myyspeed>-(myspeed) myyspeed-=0.5 else myyspeed=-(myspeed)
}

if leftthumb_y(0)>10000 {
if myyspeed<(myspeed) myyspeed+=0.5 else myyspeed=(myspeed)
}
} else {

if leftthumb_x(0)<-15000 {
if myxspeed>-(myspeed) myxspeed-=0.5 else myxspeed=-(myspeed)
}

if leftthumb_x(0)>15000  {
if myxspeed<(myspeed) myxspeed+=0.5 else myxspeed=(myspeed)
}

if leftthumb_y(0)>10000 {
if myyspeed>-(myspeed) myyspeed-=0.5 else myyspeed=-(myspeed)
}

if leftthumb_y(0)<-10000 {
if myyspeed<(myspeed) myyspeed+=0.5 else myyspeed=(myspeed)
}

}

if leftthumb_x(0)<15000 and leftthumb_x(0)>-15000  {
if myxspeed>0 myxspeed-=0.5 else {if myxspeed<-0.5 myxspeed+=0.5 else myxspeed=0}
}

if leftthumb_y(0)<10000 and leftthumb_y(0)>-10000  {
if myyspeed>0 myyspeed-=0.5 else {if myyspeed<-0.5 myyspeed+=0.5 else myyspeed=0}
}



scrMoveSolidOn()
while (abs(myxspeed)+abs(myyspeed))>myspeed+2 {
myxspeed*=0.98
myyspeed*=0.98
}
if abs(myxspeed)=0 and abs(myyspeed)=0 legindex=0 else {
legindex+=(abs(myxspeed)+abs(myyspeed))*0.1*factor
with objDizzy {if dizziness<1 dizziness+=0.01}
if scrIsWalking(sprite_index) image_index+=(abs(myxspeed)+abs(myyspeed))*0.05
}
legdir=point_direction(0,0,myxspeed,myyspeed)
if abs(myxspeed)>0 {
if place_free(x+myxspeed,y) x+=myxspeed else {
if myyspeed=0 {
if place_free(x+myxspeed,y-8) y-=myspeed else {
if place_free(x+myxspeed,y+8) y+=myspeed else {
move_contact_solid(90-sign(myxspeed)*90,abs(myxspeed)) 
myxspeed=0
}
}
}
}
}
if abs(myyspeed)>0 {
if place_free(x,y+myyspeed) y+=myyspeed else {
if myxspeed=0 {
if place_free(x-8,y+myyspeed) x-=myspeed else {
if place_free(x+8,y+myyspeed) x+=myspeed else {
move_contact_solid(-sign(myyspeed)*90,abs(myyspeed)) 
myyspeed=0
}
}
}
}
}
if x<-64 x=-64
if x>room_width+64 x=room_width+64
if y<-64 y=-64
if y>room_height+64 y=room_height+64
scrMoveSolidOff()
}

}
