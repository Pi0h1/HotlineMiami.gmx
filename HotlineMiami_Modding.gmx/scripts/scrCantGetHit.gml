if argument0=objDogPatrol return true
if argument0=objBoss1 {global.my_id.direction=point_direction(x,y,global.my_id.x,global.my_id.y) global.my_id.speed*=0.8 return true}
if argument0=objBoss2 {global.my_id.direction=point_direction(x,y,global.my_id.x,global.my_id.y) global.my_id.speed*=0.8 return true}
if argument0=objChief {return true}
if argument0=objEnemyFat {return true}
if argument0=objInspector {return true}
if argument0=objEGiveUp {return true}
return false
