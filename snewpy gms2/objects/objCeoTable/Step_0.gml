if global.xbox=1 scrXboxCeoTable()

if state=1 {
if !instance_exists(objPhoneConversation) {
state=2
instance_create(320,40,objPlayerBoss)
}
} else {
if room=rmPhoneHomUpstairsBiker and state=0 and !instance_exists(objCEO) with objElevator valid=0
}
