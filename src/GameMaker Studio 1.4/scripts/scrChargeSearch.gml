//scrSearch(goalx,goaly,precision)
check=scrLook(argument0,argument1,argument2)
if check=0 {alert=1 alertwait=10}
if check=2 {alert=2}//{scrChase(path,objPlayer.x,objPlayer.y) alert=3}
if check>0 and check<2 {speed=0 if alert>0 {alert=3 scrChase(path,argument0,argument1)} else alert=0}
