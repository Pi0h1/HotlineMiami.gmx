switch (argument0) {
    case sprEWalkShotgun: return sprESearchShotgun;
    case sprEWalkM16: return sprESearchM16;
    case sprEWalkDoubleBarrel: return sprESearchDoubleBarrel;
    case sprEWalkKnife: return sprESearchKnife;
    case sprEWalkBat: return sprESearchBat;
    case sprEWalkClub: return sprESearchClub;
    case sprEWalkPipe: return sprESearchPipe;
    case sprEWalkSilencer: return sprESearchSilencer;
    case sprEFatWalk: return sprESearchFat;
    
    case sprPoliceWalkGun: return sprPoliceSearchGun;
    case sprPoliceWalkM16: return sprPoliceSearchM16;
    case sprPoliceWalkShotgun: return sprPoliceSearchShotgun;
    case sprPoliceWalkNightStick: return sprPoliceSearchNightStick;
    case sprPInspectorWalk: return sprPInspectorSearch;
}

return argument0;
