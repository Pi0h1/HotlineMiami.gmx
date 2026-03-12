instance_create(x,y,objFlies)
if surface_exists(global.surf1) surface_free(global.surf1)
global.surf1=surface_create(500,288)
surface_set_target(global.surf1)
draw_clear(c_white)
surface_reset_target()
talk=0
reload=0
skip=0
on=1
i=0
repeat (29) {
my_x[i]=random(400)
my_y[i]=random(256)
mydir[i]=random(360)
diradd[i]=-4+random(8)
size[i]=1+random(3)
myspeed[i]=size[i]
i+=1
}

