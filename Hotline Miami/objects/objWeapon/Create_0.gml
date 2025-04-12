image_angle=random(360)
image_index=floor(random(35))
while (global.newgun[15]=0 and image_index=7) or (global.newgun[0]=0 and image_index=8) or (global.newgun[8]=0 and image_index=9) or (global.newgun[2]=0 and image_index=10) or (global.newgun[5]=0 and image_index=11) or (global.newgun[12]=0 and image_index=12) or image_index=13 or image_index=14 or (global.newgun[13]=0 and image_index=15) or image_index=16 or image_index=17 or (global.newgun[3]=0 and image_index=18) or (global.newgun[9]=0 and image_index=19) or image_index=20 or image_index=21 or image_index=22 or image_index=23 or image_index=24 or image_index=25 or image_index=26 or (global.newgun[14]=0 and image_index=27) or (global.newgun[1]=0 and image_index=28) or (global.newgun[4]=0 and image_index=29) or (global.newgun[7]=0 and image_index=30) or (global.newgun[10]=0 and image_index=31) or (global.newgun[6]=0 and image_index=32) or (global.newgun[11]=0 and image_index=33) or image_index=34 image_index=floor(random(35))
ammo=0
if global.maskindex=17 image_index=choose(2,3,4,5)
if global.maskindex=3 image_index=choose(0,1,6)
if image_index=0 ammo=24
if image_index=1 ammo=6
if image_index=6 ammo=2
if image_index=7 ammo=13
if image_index=9 ammo=30
if image_index=10 ammo=6
if image_index=11 ammo=20
if image_index=12 ammo=32

image_speed=0
dir=random(360)
