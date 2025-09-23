function scrIndexToWeapon(argument0) {
	// For use with willem mask to give weapons upon throating enemies
	switch (argument0) {
	    case 0: return sprPWalkM16;
	    case 1: return sprPWalkShotgun;
	    case 2: return sprPWalkClub;
	    case 3: return sprPWalkPipe;
	    case 4: return sprPWalkBat;
	    case 5: return sprPWalkKnife;
	    case 6: return sprPWalkDoubleBarrel;
	    case 7: return sprPWalkSilencer;
	    case 16: return sprPWalkNightStick;
	    default: return sprPWalkUnarmed;
	}



}
