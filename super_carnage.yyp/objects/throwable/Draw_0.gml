if on=1 depth=0 else depth=2
if instance_exists(player)
{
if player.gun>-1 on=0
if on=1
{
x=player.x+lengthdir_x(12,player.my_angle-30)
y=player.y+lengthdir_y(12,player.my_angle-30)
image_angle=player.my_angle
}
}
else on=0
if speed>0 image_angle+=speed*3*dir_change
draw_my_sprite()
