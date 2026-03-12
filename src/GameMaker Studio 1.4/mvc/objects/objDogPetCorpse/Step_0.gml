if smirked=0 {
if point_distance(x,y,objPlayer.x,objPlayer.y)<40 {
scrGetMessage(1)
smirked=1
}
}

if smirked=1 {
if !instance_exists(objPhoneConversation) {
if wait>0 wait-=1 else {
scrGetMessage(2)
smirked=2
}
}
}
/*
if smirked=1 {
if instance_exists(objPhoneConversation) {
if vol>0.35 vol-=0.01
sxeasy_setVolume(vol)
} else {
if vol<1 {
vol+=0.05
sxeasy_setVolume(vol)
}
}
}*/
/* */
/*  */
