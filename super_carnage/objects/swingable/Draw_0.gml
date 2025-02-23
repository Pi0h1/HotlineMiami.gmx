if on=1 depth=0 else depth=2
if speed>0 image_angle+=speed*10*dir_change

if swing_speed>0 and swing_angle>=45 {swing_speed=0 swing_angle=45 image_yscale=1}
if swing_speed<0 and swing_angle<=-45 {swing_speed=0 swing_angle=-45 image_yscale=-1}
if on=1
{
swing_angle+=swing_speed
}
if instance_exists(player)
{
if player.gun>-2 on=0
if on=1
{
x=player.x+lengthdir_x(6,player.my_angle+swing_angle)
y=player.y+lengthdir_y(6,player.my_angle+swing_angle)
image_angle=player.my_angle+swing_angle*2
if swing_speed>0 or swing_speed<0 draw_sprite_index_angle(swing_spr,floor(random(3)),player.my_angle+swing_angle*2)
}
}
else on=0
if speed>0 image_angle+=speed*3*dir_change
draw_my_sprite()
