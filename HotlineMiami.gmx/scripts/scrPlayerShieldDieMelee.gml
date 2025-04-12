with objPlayer {
image_xscale=1
image_yscale=1
edir=point_direction(global.my_id.x,global.my_id.y,x,y)
repeat (2*3) {
my_id=instance_create(x-3+random(6)+lengthdir_x(8,edir),y-3+random(6)+lengthdir_y(8,edir),objBloodDrop)
my_id.image_xscale=1-random(0.2)
my_id.image_yscale=my_id.image_xscale
my_id.image_angle=point_direction(x+lengthdir_x(8,edir),y+lengthdir_y(8,edir),my_id.x,my_id.y)
my_id.sprite_index=sprBloodSplatSmall
my_id.direction=my_id.image_angle
my_id.speed=2+random(4)
}
repeat (1+random(3)) {
my_id=instance_create(x-3+random(6)+lengthdir_x(8,edir),y-3+random(6)+lengthdir_y(8,edir),objBloodDrop)
my_id.image_xscale=1-random(0.2)
my_id.image_yscale=my_id.image_xscale
my_id.image_angle=point_direction(x+lengthdir_x(8,edir),y+lengthdir_y(8,edir),my_id.x,my_id.y)
my_id.direction=my_id.image_angle
my_id.speed=1+random(5)
}
repeat (3) {
my_id=instance_create(x-3+random(6)+lengthdir_x(16,edir),y-3+random(6)+lengthdir_y(16,edir),objBloodSmoke)
my_id.image_xscale=1.2-random(0.2)
my_id.image_yscale=my_id.image_xscale
my_id.image_angle=edir-20+random(40)
my_id.direction=my_id.image_angle
my_id.speed=2+random(1)
my_id.friction=0.15
}
if 3>1 or round(random(1)) or energie<0 {
my_id=instance_create(x+lengthdir_x(12,dir-45),y+lengthdir_y(12,dir-45),objDeadBody)
my_id.sprite_index=choose(sprEBackBlunt,sprEBackBlunt,sprEFrontBlunt)
my_id.image_index=4+random(6)
my_id.direction=edir-8+random(16)
my_id.speed=1.5+random(1)+3*0.15
my_id.image_angle=my_id.direction
instance_destroy()

my_id=instance_create(x,y,objPlayerDead)
my_id.sprite_index=choose(sprPFrontBlunt,sprPBackBlunt,sprPBackBlunt)
my_id.image_index=1+floor(random(4))
my_id.direction=edir
my_id.speed=1.5+random(1)+3*0.15
my_id.image_angle=my_id.direction
my_id=instance_create(x+lengthdir_x(24,edir),y+lengthdir_y(24,edir),objMaskDrop)
my_id.direction=edir-40+random(80)
my_id.speed=1.5+random(1)
instance_destroy()
}
}
