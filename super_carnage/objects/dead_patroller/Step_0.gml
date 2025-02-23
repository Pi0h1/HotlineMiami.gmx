if speed=0 and start=0
{
if image_index<8 instance_create(x,y,blood_pool)
start=1
}
if speed>0 and image_index=8 
{
instance_create(x-10+random(20),y-10+random(20),smoke2)
}
