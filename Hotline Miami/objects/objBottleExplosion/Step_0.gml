if round(random(3))=2 {
dir=random(360)
dist=random(20)
my_id=instance_create(x+lengthdir_x(dist,dir),y+lengthdir_y(dist,dir),objFlameParticle)
my_id.direction=dir
my_id.speed=dist*0.025+random(1)
}
