globalvar list,myx,myy,result,instance;
global.list=ds_list_create()
global.myx=x
global.myy=y
with argument0 {
ds_list_add(global.list,point_distance(x,y,global.myx,global.myy))
}
ds_list_sort(global.list,1)
if ds_list_size(global.list)>0 global.result=ds_list_find_value(global.list,argument1) else global.result=-12324
if global.result>0 {
with argument0 if point_distance(x,y,global.myx,global.myy)=global.result global.instance=id
} else global.instance=-12324
ds_list_destroy(global.list)
return global.instance
