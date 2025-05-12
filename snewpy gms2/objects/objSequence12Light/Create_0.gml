surface_free(global.surf1)
global.surf1=surface_create(500,288)
surface_set_target(global.surf1)
draw_clear_alpha(c_black,0)
surface_reset_target()
talk=0
reload=0

i=0
repeat (30) {
size[i]=1+random(2)
myx[i]=random(room_width)
myy[i]=random(room_height)
mydir[i]=random(360)
myspeed[i]=1+random(2)
diradd[i]=-4+random(8)
i+=1
}
skip=0
on=1

