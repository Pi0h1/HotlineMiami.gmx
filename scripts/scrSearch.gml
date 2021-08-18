//scrSearch(goalx,goaly,precision)
if checkreload>0 checkreload-=1 else {
if global.maskindex=18 dist=100 else dist=220
if point_distance(x,y,argument0,argument1)<dist or path_index>=0 or speed>0 {
check=scrLook(argument0,argument1,argument2)
} else check=1
if check=0 {if alert=0 and alertwait=-1 alertwait=15 if alert=2 or alert=3 alert=1}
if check=2 {path_end() alert=2}
if check>0 and check<2 {if alert>0 {alert=3 scrChase(path,argument0,argument1)} else {alert=0}}
checkreload=30
}
