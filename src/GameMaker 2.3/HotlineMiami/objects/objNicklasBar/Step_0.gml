if talked=1 and !instance_exists(objPhoneConversation) {
if served=0 {
served=1 {sprite_index=sprNicklasServe image_index=0}
}
}

if sprite_index=sprNicklasServe {
if image_index>=21 {
if served=1 {
instance_create(x-10,y+14,objDrink)
served=2
}
}
}

if global.xbox=1 scrXboxNickeTalkBar()
