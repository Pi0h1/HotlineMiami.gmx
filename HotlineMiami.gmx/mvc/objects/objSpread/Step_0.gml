image_angle+=0.1-random(0.2)
image_xscale+=scalespeed
image_yscale=image_xscale
if image_index<28 image_index+=ispeed else {image_angle=random(360) scalespeed=random(0.02) direction=random(360) image_index=0 ispeed=0.2+random(0.1) x=random(room_width) y=random(room_height) image_xscale=0.7+random(0.4) image_yscale=image_xscale}
