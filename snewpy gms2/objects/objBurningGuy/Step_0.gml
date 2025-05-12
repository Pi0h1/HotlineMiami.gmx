if round(random(20))=2 diradd=-4+random(8)
scrMoveSolidOn()
if !place_free(x+hspeed*4,y) hspeed=-hspeed
if !place_free(x,y+vspeed) vspeed=-vspeed
scrMoveSolidOff()
direction+=diradd

my_id=instance_create(x,y,objFlameParticle)
my_id.direction=random(360)
my_id.speed=2+random(3)
my_id.friction=0.15
