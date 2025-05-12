if check=1 {
check=0
if follow=0 {
global.my_id=id
with objLetterSocket {
global.check=0
global.myx=x
global.myy=y
with objLetter {if x=global.myx and y=global.myy global.check=1} 
if global.check=0 {
if place_meeting(x,y,global.my_id) {global.my_id.x=x global.my_id.y=y}
}
}
}
}

if follow=1 {
if global.xbox=1 {
x=objPuzzle.mousex
y=objPuzzle.mousey
} else {
x=mouse_x
y=mouse_y
}
}
