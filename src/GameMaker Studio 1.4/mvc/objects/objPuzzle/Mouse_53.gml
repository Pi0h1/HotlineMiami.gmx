if global.xbox=1 exit
if off=1 exit
global.test=-12323
with objLetter {if follow=1 global.test=1}
if global.test>0 {with objLetter follow=0 exit}
x=mouse_x
y=mouse_y
with objLetter {
follow=0
if place_meeting(x,y,objPuzzle) {global.test=id}
}
with global.test follow=1
