if start=0
{
if image_xscale<1 image_xscale+=0.025 else start=1
}
if start=1
{
if image_xscale>0 image_xscale-=0.025 else instance_destroy()
}
image_yscale=image_xscale
image_angle+=5*dir_change
