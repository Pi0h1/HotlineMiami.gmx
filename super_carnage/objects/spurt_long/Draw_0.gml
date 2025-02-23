if dir=0
{
x=target.x+lengthdir_x(15,target.image_angle-35)
y=target.y+lengthdir_y(15,target.image_angle-35)
}
if dir=1
{
x=target.x+lengthdir_x(15,target.image_angle+35)
y=target.y+lengthdir_y(15,target.image_angle+35)
}
if dir=3
{
x=target.x+lengthdir_x(12,target.image_angle)
y=target.y+lengthdir_y(12,target.image_angle)
}
if dir=4
{
x=target.x
y=target.y
}
if dir=5//dog
{
x=target.x+lengthdir_x(8,target.image_angle)
y=target.y+lengthdir_y(8,target.image_angle)
}
draw_my_sprite()
