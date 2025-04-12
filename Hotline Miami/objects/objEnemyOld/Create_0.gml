image_speed=0
image_index=random(1000)
angle=random(360)

direction=angle
speed=round(random(1))
image_speed=speed*0.1
alarm[0]=60+random(60)
energie=round(random(1))

my_path=path_add()
path_set_kind(my_path,1)
path_set_precision(my_path,2)
checkreload=floor(random(30))
ammo=24
alert=0
reload=13
light=0

weaponfind=0

