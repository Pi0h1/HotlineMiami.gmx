image_index=0
global.test=-1234
global.my_id=id
global.target=target
with objLetter {
if place_meeting(x,y,global.my_id) {
if follow=1 global.test=-20
if image_index=global.target {
if follow=1 global.test=-20 else {if check=1 global.test=id}
}
}
}
if global.test=-20 or instance_exists(global.test) {
image_index=1
}
if instance_exists(global.test) {
global.test.x=x
global.test.y=y
with global.test {
my_id=instance_create(x,y,objLetterDone)
my_id.sprite_index=scrGetLetterSprite(image_index)
my_id.glowsprite=scrGetGlowSprite(image_index)
instance_destroy()
}
}
