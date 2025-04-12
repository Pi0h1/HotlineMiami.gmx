if global.xbox=1 scrXboxJanitorComputer()

if check=0 exit
if !instance_exists(objPhoneConversation) {
if instance_exists(objPlayerBikerHack) {
with objPlayerBikerHack {
instance_create(x,y,objPlayerBikerHouse)
instance_destroy()
}
}
}
