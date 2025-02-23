if start=0
{
if image_xscale<1 image_xscale+=0.025 else start=1
}
if start=1
{
if image_xscale>0 image_xscale-=0.025 else instance_destroy()
}
if h>0 h-=5
if h=0 
{
if s>0 s-=25
if v>my_v v-=12.5
if v<my_v v=my_v
}
image_yscale=image_xscale
image_angle+=5*dir_change
image_blend=make_color_hsv(h,s,v)
