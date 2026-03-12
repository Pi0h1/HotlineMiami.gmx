i=0
bullets=0
global.my_id=id
bulldir=0
with objBullet {
if place_meeting(x,y,global.my_id) {
my_id=instance_create(x,y,objSmokeHit)
my_id.direction=direction-170+random(10)
my_id.speed=1
my_id.image_angle=my_id.direction
my_id.image_xscale=0.8+random(0.2)
my_id.image_yscale=my_id.image_xscale
if caliber=0 instance_destroy()
global.my_id.bullets+=1
global.my_id.bulldir+=direction
}
}
if bullets>0 bulldir*=(1/bullets)

if bullets>=2 {
my_id=instance_create(x,y,objBoss1Down)
my_id.direction=bulldir
my_id.image_angle=my_id.direction
my_id.speed=1
my_id.friction=0.1
my_id.energie=energie-1
if energie<=1 my_id.image_index=1
if energie<=0 {my_id.dead=1 my_id.wait=90}
instance_destroy()
} else {
if hit=0 {
sprite_index=sprBoss1Taunt
image_index=0
hit=1
}
}
