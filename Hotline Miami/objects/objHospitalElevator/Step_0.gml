mask_index=sprElevatorFloor 
touch=0

if room=rmHospitalEntrance {
if place_meeting(x,y,objPlayer) {
if wait>0 wait-=1 else {
if saved=0 {
saved=1
global.loaded=1
objPlayer.persistent=0
scrSaveGame()
global.loaded=0
}
if image_index<6 image_index+=0.5 else wait=30
}
} else {
if wait>0 wait-=1 else {
if image_index>0 image_index-=0.5
}
}
if image_index<3 mask_index=sprite_index else mask_index=sprElevatorMask
exit
}

if !place_meeting(x,y,objPlayer) {
if point_distance(x,y,objPlayer.x,objPlayer.y)<96 {
if wait>0 wait-=1 else {if image_index<6 image_index+=0.5}
} else {if image_index>0 image_index-=0.5 wait=10}
}


if place_meeting(x,y,objPlayer) {
touch=1
objPlayer.addx=0
objPlayer.addy=0
if objPlayer.x<x-2 objPlayer.x+=2
if objPlayer.x>x+2 objPlayer.x-=2
if objPlayer.y<y-2 objPlayer.y+=2
if objPlayer.y>y+2 objPlayer.y-=2
if objPlayer.x<x+2 and objPlayer.x>x-2 and objPlayer.y>y-2 and objPlayer.y<y+2 nothing=1 else {
objPlayer.image_index+=0.15
objPlayer.legindex+=0.4
}
objPlayer.persistent=1
if image_angle=0 {
if objPlayer.y>y objPlayer.addy=0
}
if image_angle=90 {
if objPlayer.x>x objPlayer.addx=0
}
if image_angle=180 {
if objPlayer.y<y objPlayer.addy=0
}
if image_angle=270 {
if objPlayer.x<x objPlayer.addx=0
}



if wait2>0 wait2-=1 else {
if image_index>0 image_index-=0.5
if objEffector.fade=0 {
objPlayer.movex=movex
objPlayer.movey=movey
if abs(movex)>0 or abs(movey)>0 objPlayer.move=1
objEffector.next=1
objEffector.fade=1
objEffector.nextroom=nextroom

}
}
}

if image_index<3 mask_index=sprite_index else mask_index=sprElevatorMask
