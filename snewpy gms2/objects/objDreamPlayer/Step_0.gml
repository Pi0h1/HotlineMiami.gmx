if !instance_exists(objPlayer) alert=1 else {
alert=scrLook(objPlayer.x,objPlayer.y,4)
if point_distance(x,y,objPlayer.x,objPlayer.y)>100 alert=1
}
if alert=0 or alert=2 {
if state=0 {
state=1
scrGetMessage(0)
with objPlayer active=0
} 
if state=1 {
if !instance_exists(objPhoneConversation) {objPlayer.active=1 objEffectorHouse.brus=10 with objDoorV solid=0 state=2}
}
}



if objEffectorHouse.fade=1 {
objEffectorHouse.amount+=9.5
} else { if round(random(100))=2 objEffectorHouse.brus=2+floor(random(8)) }

if state=2 {
with objPlayer {
if x>288 and x<416 and y<320 {
if sprite_index=sprPWalkUnarmed {
objEffectorHouse.brus=10
sprite_index=sprPWalkHospital
with objBackgroundColor instance_destroy()
instance_create(x,y,objBackgroundColorClear)
}

if y<64 {
if sprite_index=sprPWalkHospital {legindex=0 aimon=0 sprite_index=sprPHeadExplode image_index=1 active=0 image_speed=0.15}
}
}
}
}


