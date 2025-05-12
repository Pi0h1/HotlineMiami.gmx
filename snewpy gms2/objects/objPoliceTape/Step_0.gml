if place_meeting(x,y-2,objPlayer) {
if objPlayer.x>x+13 and objPlayer.x<x+19 {
with objPlayer instance_destroy()
instance_create(x,y,objPlayerRipTape)
instance_destroy()
}
}
