var nextroom;
nextroom=rmScore
if argument0=rmTrainstationEntrance nextroom=rmAlley
if argument0=rmBuildingFloor1 nextroom=rmPhoneHomEntrance
if argument0=rmPhoneHomEntranceBiker nextroom=rmMCSequence4
if argument0=rmHighballer {nextroom=rmMenu objEffector.restart=1}
if argument0=rmEurogamer {nextroom=rmMenu objEffector.restart=1}
return nextroom
