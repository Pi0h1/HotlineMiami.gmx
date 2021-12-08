if argument0="Melee"{
with objWindowV {
if broken=false{
if place_meeting(x,y,global.my_id) {
SteamIncStat("Windows",1)
if global.my_id.lastx<x+2 {
add=-1
} else {
add=1
}
i=0

scrCreateShards();
broken=true;
image_index=1
global.shake=4
PlaySFX("Strong Glass")
}
}
}
}
else
{

with other {
if broken=false{
broken=true
image_index=1
global.shake=4
PlaySFX("Strong Glass")

if other.hspeed>0 {
add=-1
} else {
add=1
}
i=0

scrCreateShards();
}
}

}
