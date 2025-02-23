if image_index=1 or image_index=4 or image_index=5
{
repeat 4+random(2)
{
my_i=instance_create(x+lengthdir_x(8,image_angle),y+lengthdir_y(8,image_angle),spurt_long)
my_i.image_angle=image_angle-45+random(90)
my_i.target=id
my_i.dir=5
}
repeat (4+round(random(4)))
{
if round(random(1))=0 my_i=instance_create(x+lengthdir_x(6,image_angle),y+lengthdir_y(6,image_angle),flesh) else my_i=instance_create(x+lengthdir_x(6,image_angle),y+lengthdir_y(6,image_angle),brains)
my_i.speed=1.5+random(1.5)
my_i.direction=image_angle-30+random(60)
}
}
else sound_play(dog_die)
