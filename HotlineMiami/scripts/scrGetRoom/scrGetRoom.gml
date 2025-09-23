function scrGetRoom() {
	if (room == rmMCBar) {
	    global.done = 0;
	    global.phone = 0;
	    global.package = 0;
	    global.level = rmNoodleShop;
	    global.pretitle = "SIXTEENTH CHAPTER";
	    global.title = "SAFEHOUSE";
	    global.sequence = rmMCBar;
	    global.revisit = 0;
	    return rmMCChapter;
	}

	switch (room) {
	    case rmNoodleShop: return rmScore;
	    case rmMCSequence2Downstairs: return rmMCChapter;
	    case rmArcadeDownstairs: return rmScore;
	    case rmMCSequence3Downstairs: return rmMCChapter;
	    case rmPhoneHomEntranceBiker: return rmMCSequence4;
	    case rmMCSequence4Downstairs: return rmMCChapter;
	    case rmJanitors: return rmBikeEnding;
	    default: return room;
	}



}
