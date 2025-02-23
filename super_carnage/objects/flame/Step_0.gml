image_blend=make_color_hsv(0,random(50),255)
image_xscale=scale*(1+(random(0.2)))
image_yscale=image_xscale
image_angle=random(360)
if scale<1 scale+=0.035 else instance_destroy()

