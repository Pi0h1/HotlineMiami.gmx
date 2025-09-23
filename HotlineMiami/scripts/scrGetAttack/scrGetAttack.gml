function scrGetAttack(argument0) {
	// Give enemy attack melee sprite based on what weapon they're holding
	if (argument0 == sprEWalkClub || sprite_index == sprEWalkClub)
	    return sprEAttackClub;

	if (argument0 == sprEWalkPipe || sprite_index == sprEWalkPipe)
	    return sprEAttackPipe;

	if (argument0 == sprEWalkBat || sprite_index == sprEWalkBat)
	    return sprEAttackBat;

	if (argument0 == sprEWalkKnife || sprite_index == sprEWalkKnife)
	    return sprEAttackKnife;

	if (argument0 == sprPoliceWalkNightStick)
	    return sprPoliceAttackNightStick;

	if (argument0 == sprHoboWalkBat)
	    return sprHoboAttack;

	return argument0;



}
