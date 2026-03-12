if talked=1 {
if !instance_exists(objPhoneConversation) {
if objBoss2Corpse.state=0 {
objBoss2Corpse.state=1
objPlayer.image_index=0
objPlayer.active=0
scrGetMessage(talked)
talked+=1
}
}
}

if talked=2 {
if !instance_exists(objPhoneConversation) {
scrGetMessage(talked)
objPlayer.image_index=0
objPlayer.active=0
talked+=1
with objBoss2Corpse state=2
}
}

if talked=3 {
if !instance_exists(objPhoneConversation) {
if instance_exists(objBoss2Corpse) {with objBoss2Corpse instance_destroy() objEffectorHouse.brus=10 objAssassinWait.visible=1}
}
}

if talked>3 {
if round(random(140))=2 {
brus=2+floor(random(8))
if objEffectorHouse.brus<brus objEffector.brus=brus
}
}

if global.xbox=1 scrXboxNickeTalkSpecial()
