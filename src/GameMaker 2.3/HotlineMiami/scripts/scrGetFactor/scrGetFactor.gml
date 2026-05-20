function scrGetFactor(){
	var factor = 0;

	with (objEnemy) {
		switch (sprite_index) {
			// Do this for every instance of an unarmed enemy.
			case sprEWalkUnarmed:
			case sprPoliceWalkUnarmed:
			case sprHoboWalk:
				break;
			default:
				factor += sign(alert);
				break;
		}
	}

	// Make sure to copy this code for every instance of an enemy head kick.
	with (objEnemyHeadKick) {
		if (global.maskindex == 4)
			factor += 4;
	}

	return factor;
}