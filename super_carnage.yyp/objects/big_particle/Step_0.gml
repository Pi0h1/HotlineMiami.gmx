if speed>0 speed-=0.075 else instance_destroy()
if v>0 {v-=2.5 if speed>0.5 {my_i=instance_create(x-6+random(12),y-6+random(12),smoke2) my_i.image_blend=make_color_hsv(0,0,100+random(20))}} else v=0
image_blend=make_color_hsv(0,0,v)

