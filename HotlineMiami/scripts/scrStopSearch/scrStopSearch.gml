function scrStopSearch(argument0) {
	switch (argument0) {
	    case sprESearchShotgun: return sprEWalkShotgun;
	    case sprESearchM16: return sprEWalkM16;
	    case sprESearchDoubleBarrel: return sprEWalkDoubleBarrel;
	    case sprESearchKnife: return sprEWalkKnife;
	    case sprESearchBat: return sprEWalkBat;
	    case sprESearchClub: return sprEWalkClub;
	    case sprESearchPipe: return sprEWalkPipe;
	    case sprESearchSilencer: return sprEWalkSilencer;
	    case sprESearchFat: return sprEFatWalk;
    
	    case sprPoliceSearchGun: return sprPoliceWalkGun;
	    case sprPoliceSearchNightStick: return sprPoliceWalkNightStick;
	    case sprPoliceSearchM16: return sprPoliceWalkM16;
	    case sprPoliceSearchShotgun: return sprPoliceWalkShotgun;
	    case sprPInspectorSearch: return sprPInspectorWalk;
	}
	return argument0;



}
