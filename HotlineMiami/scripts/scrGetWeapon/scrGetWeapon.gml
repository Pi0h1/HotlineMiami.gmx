function scrGetWeapon() {
	// After picking up a weapon, give the appropriate sprite.
	switch (image_index) {
	    case 0: objPlayer.sprite_index = sprPWalkM16; break;
	    case 1: objPlayer.sprite_index = sprPWalkShotgun; break;
	    case 2: objPlayer.sprite_index = sprPWalkClub; break;
	    case 3: objPlayer.sprite_index = sprPWalkPipe; break;
	    case 4: objPlayer.sprite_index = sprPWalkBat; break;
	    case 5: objPlayer.sprite_index = sprPWalkKnife; break;
	    case 6: objPlayer.sprite_index = sprPWalkDoubleBarrel; break;
	    case 7: objPlayer.sprite_index = sprPWalkSilencer; break;
	    case 8: objPlayer.sprite_index = sprPWalkSword; break;
	    case 9: objPlayer.sprite_index = sprPWalkUzi; break;
	    case 10: objPlayer.sprite_index = sprPWalkMagnum; break;
	    case 11: objPlayer.sprite_index = sprPWalkScorpion; break;
	    case 12: objPlayer.sprite_index = sprPWalkMP5; break;
	    case 13: objPlayer.sprite_index = sprPWalkPool; break;
	    case 14: objPlayer.sprite_index = sprPWalkPoolBroke; break;
	    case 15: objPlayer.sprite_index = sprPWalkAxe; break;
	    case 16: objPlayer.sprite_index = sprPWalkNightStick; break;
	    case 17: objPlayer.sprite_index = sprPWalkCrowbar; break;
	    case 18: objPlayer.sprite_index = sprPWalkMachete; break;
	    case 19: objPlayer.sprite_index = sprPWalkSledgeHammer; break;
	    case 20: objPlayer.sprite_index = sprPWalkTrophy; break;
	    case 21: objPlayer.sprite_index = sprPWalkDrill; break;
	    case 22: objPlayer.sprite_index = sprPWalkPan; break;
	    case 23: objPlayer.sprite_index = sprPWalkBoilingPot; break;
	    case 24: objPlayer.sprite_index = sprPWalkPot; break;
	    case 25: objPlayer.sprite_index = sprPWalkSilencedUzi; break;
	}

	if (image_index > 26) {
	    objPlayer.sprite_index = sprPWalkThrow;
	    objPlayer.throwindex = image_index - 27;
	}
	if (image_index >= 0)
	    global.flexibility[image_index] = 1;
	global.barehanded = 0;



}
