if reload=0
{
if gun=0
{
reload=4
bull_shoot=collision_line(x,y,x+lengthdir_x(36,my_angle),y+lengthdir_y(36,my_angle),solid_object,0,1)
if bull_shoot<0
{
my_bull=instance_create(x+lengthdir_x(36,my_angle),y+lengthdir_y(36,my_angle),bullet)
my_bull.direction=my_angle-7+random(14)
my_bull.speed=10
}
else
{
if bull_shoot.object_index=door_hor_left
{
if my_angle<180 bull_shoot.angle_speed+=0.75
if my_angle>180 bull_shoot.angle_speed+=-0.75
}
if bull_shoot.object_index=door_hor_right
{
if my_angle<180 bull_shoot.angle_speed+=0.75
if my_angle>180 bull_shoot.angle_speed+=-0.75
}
if bull_shoot.object_index=door_vert_up
{
if my_angle>90 and my_angle<270 bull_shoot.angle_speed+=-0.75
if my_angle<90 or my_angle>270 bull_shoot.angle_speed+=0.75
}
if bull_shoot.object_index=door_vert_down
{
if my_angle>90 and my_angle<270 bull_shoot.angle_speed+=0.75
if my_angle<90 or my_angle>270 bull_shoot.angle_speed+=-0.75
}
}
sound_player.play_mg=1
}

if gun=1
{
reload=45
sound_player.play_sg=1
bull_shoot=collision_line(x,y,x+lengthdir_x(36,my_angle),y+lengthdir_y(36,my_angle),solid_object,0,1)
if bull_shoot<0
{
repeat (12)
{
my_bull=instance_create(x+lengthdir_x(40,my_angle),y+lengthdir_y(40,my_angle),bullet)
my_bull.direction=my_angle-8+random(16)
my_bull.speed=12-random(4)
}
}
else
{
repeat (12)
{
if bull_shoot.object_index=door_hor_left
{
if my_angle<180 bull_shoot.angle_speed+=0.75
if my_angle>180 bull_shoot.angle_speed+=-0.75
}
if bull_shoot.object_index=door_hor_right
{
if my_angle<180 bull_shoot.angle_speed+=0.75
if my_angle>180 bull_shoot.angle_speed+=-0.75
}
if bull_shoot.object_index=door_vert_up
{
if my_angle>90 and my_angle<270 bull_shoot.angle_speed+=-0.75
if my_angle<90 or my_angle>270 bull_shoot.angle_speed+=0.75
}
if bull_shoot.object_index=door_vert_down
{
if my_angle>90 and my_angle<270 bull_shoot.angle_speed+=0.75
if my_angle<90 or my_angle>270 bull_shoot.angle_speed+=-0.75
}
}
}


}

if gun=2
{
reload=15
sound_player.play_ssg=1
bull_shoot=collision_line(x,y,x+lengthdir_x(36,my_angle),y+lengthdir_y(36,my_angle),solid_object,0,1)
if bull_shoot<0
{
repeat (8)
{
my_bull=instance_create(x+lengthdir_x(40,my_angle),y+lengthdir_y(40,my_angle),bullet)
my_bull.direction=my_angle-8+random(16)
my_bull.speed=12-random(4)
}
}
else
{
repeat (12)
{
if bull_shoot.object_index=door_hor_left
{
if my_angle<180 bull_shoot.angle_speed+=0.75
if my_angle>180 bull_shoot.angle_speed+=-0.75
}
if bull_shoot.object_index=door_hor_right
{
if my_angle<180 bull_shoot.angle_speed+=0.75
if my_angle>180 bull_shoot.angle_speed+=-0.75
}
if bull_shoot.object_index=door_vert_up
{
if my_angle>90 and my_angle<270 bull_shoot.angle_speed+=0.75
if my_angle<90 or my_angle>270 bull_shoot.angle_speed+=-0.75
}
if bull_shoot.object_index=door_vert_down
{
if my_angle>90 and my_angle<270 bull_shoot.angle_speed+=-0.75
if my_angle<90 or my_angle>270 bull_shoot.angle_speed+=0.75
}
}
}
}

if gun=3
{
reload=1
if collision_line(x,y,x+lengthdir_x(32,my_angle),y+lengthdir_y(36,my_angle),solid_object,0,1)<0
{
my_bull=instance_create(x+lengthdir_x(28,my_angle),y+lengthdir_y(28,my_angle),flame)
my_bull.direction=my_angle-5+random(10)
my_bull.speed=4
}
}


if gun=4
{
reload=1
if minigun<2 minigun+=1 else minigun=0
bull_shoot=collision_line(x,y,x+lengthdir_x(36,my_angle),y+lengthdir_y(36,my_angle),solid_object,0,1)
my_cart=instance_create(x+lengthdir_x(18,my_angle-10),y+lengthdir_y(18,my_angle-10),cartridge)
my_cart.direction=my_angle-110+random(20)
my_cart.speed=1+random(2)
my_cart.image_index=0
if bull_shoot<0
{
my_bull=instance_create(x+lengthdir_x(36,my_angle),y+lengthdir_y(36,my_angle),bullet)
my_bull.direction=my_angle-7+random(14)
my_bull.speed=10
}
else
{
if bull_shoot.object_index=door_hor_left
{
if my_angle<180 bull_shoot.angle_speed+=0.75
if my_angle>180 bull_shoot.angle_speed+=-0.75
}
if bull_shoot.object_index=door_hor_right
{
if my_angle<180 bull_shoot.angle_speed+=0.75
if my_angle>180 bull_shoot.angle_speed+=-0.75
}
if bull_shoot.object_index=door_vert_up
{
if my_angle>90 and my_angle<270 bull_shoot.angle_speed+=-0.75
if my_angle<90 or my_angle>270 bull_shoot.angle_speed+=0.75
}
if bull_shoot.object_index=door_vert_down
{
if my_angle>90 and my_angle<270 bull_shoot.angle_speed+=0.75
if my_angle<90 or my_angle>270 bull_shoot.angle_speed+=-0.75
}
}
sound_player.play_minishoot=1
}


}
