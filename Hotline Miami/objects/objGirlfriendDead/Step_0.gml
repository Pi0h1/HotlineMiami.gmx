if room=rmSequence12b {
if smirked=0 {
if instance_exists(objPlayer) {
if point_distance(x,y,objPlayer.x,objPlayer.y)<20 {
scrGetMessage(1)
smirked=1
}
}
}
}
