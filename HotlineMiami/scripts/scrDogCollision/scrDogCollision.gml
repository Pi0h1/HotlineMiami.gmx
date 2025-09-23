function scrDogCollision(argument0, argument1) {
	if (place_meeting(argument0, argument1, objGlassPanelH) || place_meeting(argument0, argument1, objGlassPanelV)) {
	    check = 1;
	    stop = 1;
	    return false;
	}
	if (place_meeting(argument0, argument1, objGlassPanelHBroken) || place_meeting(argument0, argument1, objGlassPanelVBroken) || place_meeting(argument0, argument1, objFurniture))
	    return true;
	else return false;



}
