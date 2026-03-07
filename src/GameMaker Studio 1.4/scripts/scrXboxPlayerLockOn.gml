if instance_exists(global.enemy) { global.enemy=-1234 exit}

global.enemy=scrInstanceNearestExt(global.mousex,global.mousey,objEnemy,objEnemyIdle,objEHideM16,objBoss,objPanther,objMiscEnemy) //instance_nearest(global.mousex,global.mousey,objEnemy)
if !instance_exists(global.enemy) global.enemy=-1234
/*lastx=x
lasty=y
x=global.mousex
y=global.mousey
image_xscale=2
image_yscale=2
if place_meeting(global.mousex,global.mousey,objEnemy) {

global.enemy=-1234
with objEnemy {
if place_meeting(x,y,objPlayer) global.enemy=id
}


}

if place_meeting(global.mousex,global.mousey,objEnemyIdle) {
x=global.mousex
y=global.mousey
global.enemy=-1234
with objEnemyIdle {
if place_meeting(x,y,objPlayer) global.enemy=id
}
}

if place_meeting(global.mousex,global.mousey,objEHideM16) {
x=global.mousex
y=global.mousey
global.enemy=-1234
with objEHideM16 {
if place_meeting(x,y,objPlayer) global.enemy=id
}
}

if place_meeting(global.mousex,global.mousey,objBoss) {
x=global.mousex
y=global.mousey
global.enemy=-1234
with objBoss {
if place_meeting(x,y,objPlayer) global.enemy=id
}
}

if place_meeting(global.mousex,global.mousey,objPanther) {
x=global.mousex
y=global.mousey
global.enemy=-1234
with objPanther {
if place_meeting(x,y,objPlayer) global.enemy=id
}
}

if place_meeting(global.mousex,global.mousey,objMiscEnemy) {
x=global.mousex
y=global.mousey
global.enemy=-1234
with objMiscEnemy {
if place_meeting(x,y,objPlayer) global.enemy=id
}
}

x=lastx
y=lasty

image_xscale=1
image_yscale=1
