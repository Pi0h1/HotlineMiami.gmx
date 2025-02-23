function intersection(argument0, argument1, argument2, argument3, argument4) {
	if argument4=0 {return -100 exit}
	dist=point_distance(argument0,argument1,argument2,argument3)
	dir=point_direction(argument0,argument1,argument2,argument3)
	my_x=argument0
	my_y=argument1
	addx=lengthdir_x(argument4,dir)
	addy=lengthdir_y(argument4,dir)
	i=0
	while collision_point(my_x,my_y,solid_object,0,1)<0 and i<dist/argument4
	{
	my_x+=addx
	my_y+=addy
	i+=1
	}
	if i<dist/argument4 {return 1} else return -100



}
