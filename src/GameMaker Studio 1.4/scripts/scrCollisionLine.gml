var cldist,cldir,claddx,claddy,repeats,clstartx,clstarty,i,test;
clstartx=x
clstarty=y
cldist=point_distance(argument0,argument1,argument2,argument3)
cldir=point_direction(argument0,argument1,argument2,argument3)
if cldist>0 repeats=round(cldist/argument4) else repeats=0
claddx=lengthdir_x(argument4,cldir)
claddy=lengthdir_y(argument4,cldir)
i=0
test=0
while (i<repeats)  {
x+=claddx
y+=claddy
if place_meeting(x,y,argument5) test=1
i+=1
}
x=clstartx
y=clstarty
return test
