function scrInstanceNearestExt(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {
	global.distlist=ds_list_create()
	with argument2 ds_list_add(global.distlist,point_distance(argument0,argument1,x,y))
	with argument3 ds_list_add(global.distlist,point_distance(argument0,argument1,x,y))
	with argument4 ds_list_add(global.distlist,point_distance(argument0,argument1,x,y))
	with argument5 ds_list_add(global.distlist,point_distance(argument0,argument1,x,y))
	with argument6 ds_list_add(global.distlist,point_distance(argument0,argument1,x,y))
	with argument7 ds_list_add(global.distlist,point_distance(argument0,argument1,x,y))
	ds_list_sort(global.distlist,true)
	global.my_id=-1234

	with argument2 if point_distance(argument0,argument1,x,y)=ds_list_find_value(global.distlist,0) global.my_id=id
	with argument3 if point_distance(argument0,argument1,x,y)=ds_list_find_value(global.distlist,0) global.my_id=id
	with argument4 if point_distance(argument0,argument1,x,y)=ds_list_find_value(global.distlist,0) global.my_id=id
	with argument5 if point_distance(argument0,argument1,x,y)=ds_list_find_value(global.distlist,0) global.my_id=id
	with argument6 if point_distance(argument0,argument1,x,y)=ds_list_find_value(global.distlist,0) global.my_id=id
	with argument7 if point_distance(argument0,argument1,x,y)=ds_list_find_value(global.distlist,0) global.my_id=id
	ds_list_destroy(global.distlist)
	return global.my_id



}
