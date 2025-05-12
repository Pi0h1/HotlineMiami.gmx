image_blend=c_black
scale=0.75+random(0.25)
if room=rmChapter or room=rmInterlude speed=-(scale*scale*scale)*3
if room=rmLevelSelect speed=-(scale*scale*scale)
if room=rmHospitalTitle speed=-(scale*scale*scale)*4.5
if room=rmMCChapter speed=-(scale*scale*scale)*7
image_xscale=scale
y=80-scale*32
index=0

