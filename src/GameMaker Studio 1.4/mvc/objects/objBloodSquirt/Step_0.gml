if sprite_index=sprBloodSquirt1 {
if round(random(3))=2 and image_index>=4
{
my_id=instance_create(x+lengthdir_x(38-(image_index-4)*8,image_angle)-2+random(4),y+lengthdir_y(38-(image_index-4)*8,image_angle)-2+random(4),objBloodSplat)
my_id.image_xscale=0.25+random(0.75)
my_id.image_yscale=my_id.image_xscale
}
}

if sprite_index=sprBloodSquirt2 {
if round(random(3))=2 and image_index>=4
{
my_id=instance_create(x+lengthdir_x(64-(image_index-4)*13,image_angle)-2+random(4),y+lengthdir_y(64-(image_index-4)*13,image_angle)-2+random(4),objBloodSplat)
my_id.image_xscale=0.25+random(0.75)
my_id.image_yscale=my_id.image_xscale
}
}
