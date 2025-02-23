draw_sprite_index_angle(legs,index,direction)
if gun=-1 and holding=1 draw_sprite_index_angle(holding_spr,0,my_angle)
if gun>0 
{
if gun=4 draw_sprite_index_angle(sprite_index,minigun,my_angle) else draw_sprite_index_angle(sprite_index,image_index,my_angle)
}
else draw_sprite_index_angle(sprite_index,index,my_angle)


if reload=3 and gun=0 draw_sprite_index_angle(fire_spr,round(random(1)),my_angle)
if reload=44 and gun=1 draw_sprite_index_angle(fire_spr,round(random(1)),my_angle)
if reload=14 and gun=2 draw_sprite_index_angle(fire_spr,round(random(1)),my_angle)
if mouse_check_button(mb_left) and gun=4 draw_sprite_index_angle(fire_spr,round(random(1)),my_angle)
if reload=3
{
if gun=0
{
my_cart=instance_create(x+lengthdir_x(18,my_angle-6),y+lengthdir_y(18,my_angle-8),cartridge)
my_cart.direction=my_angle-110+random(20)
my_cart.speed=1+random(2)
my_cart.image_index=0
}
}

if reload=10
{
if gun=2 
{
my_cart=instance_create(x+lengthdir_x(20,my_angle-6),y+lengthdir_y(20,my_angle-8),cartridge)
my_cart.direction=my_angle-110+random(20)
my_cart.speed=1+random(2)
my_cart.image_index=1
}
if gun=1
{
repeat(2)
{
my_cart=instance_create(x+lengthdir_x(20,my_angle-6),y+lengthdir_y(20,my_angle-8),cartridge)
my_cart.direction=my_angle-110+random(20)
my_cart.speed=1+random(2)
my_cart.image_index=1
}
}

}
