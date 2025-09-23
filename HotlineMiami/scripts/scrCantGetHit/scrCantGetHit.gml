function scrCantGetHit(argument0) {
	switch (argument0) {
	    case objDogPatrol: return true;
	    case objBoss1: global.my_id.direction = point_direction(x, y, global.my_id.x, global.my_id.y); global.my_id.speed *= 0.8; return true;
	    case objBoss2: global.my_id.direction = point_direction(x, y, global.my_id.x, global.my_id.y); global.my_id.speed *= 0.8; return true;
	    case objChief: return true;
	    case objEnemyFat: return true;
	    case objInspector: return true;
	    case objEGiveUp: return true;
	}
	return false;



}
