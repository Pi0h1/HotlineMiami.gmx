if speed=0 and start=0
{
if image_index=6 start=1 else instance_create(x,y,dog_pool)
start=1
exit
}
if speed>0 and image_index=6
{
instance_create(x-5+random(10),y-5+random(10),smoke2) 
}
