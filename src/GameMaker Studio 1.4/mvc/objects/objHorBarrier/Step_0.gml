
if !instance_exists(objPlayer) exit
if ylimit<0 {
if objPlayer.y<y and !place_meeting(x,y,objPlayer) solid=1 else solid=0
}
if ylimit>0 {
if objPlayer.y>y and !place_meeting(x,y,objPlayer) solid=1 else solid=0
}

if global.done=1 solid=0
