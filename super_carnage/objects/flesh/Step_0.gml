if speed>1
{
image_angle=random(360)
}
else
{
image_angle+=speed*20
}
if speed>0 and round(random(6))=1 instance_create(x,y,blood_small)
