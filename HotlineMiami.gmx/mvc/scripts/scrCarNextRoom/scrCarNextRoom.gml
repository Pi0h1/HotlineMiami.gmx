var nextroom;
nextroom = rmScore;
// Instead of finishing the level, take the player to some other room.
if (argument0 == rmTrainstationEntrance)
    nextroom = rmAlley;
if (argument0 == rmBuildingFloor1)
    nextroom = rmPhoneHomEntrance;
if (argument0 == rmPhoneHomEntranceBiker)
    nextroom = rmMCSequence4;
if (argument0 == rmHighballer) {
    nextroom = rmMenu;
    objEffector.restart = 1;
}
if (argument0 == rmEurogamer) {
    nextroom = rmMenu;
    objEffector.restart = 1;
}
return nextroom;
