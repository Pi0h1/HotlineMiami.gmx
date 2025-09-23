function scrGetSong(argument0) {
	if (global.done) {
	    switch (argument0) {
	        // Intro to Level Music
	        case rmSequence1Downstairs: return working_directory + "\\Paris2.mp3";
	        case rmSequence2Downstairs: return working_directory + "\\Crystals.mp3";
	        case rmSequence3Downstairs: return working_directory + "\\Hotline.mp3";
	        case rmSequence4Downstairs: return working_directory + "\\Hydrogen.mp3";
	        case rmSequence5Downstairs: return working_directory + "\\Paris2.mp3";
	        case rmSequence6Downstairs: return working_directory + "\\Crystals.mp3";
	        case rmSequence7Downstairs: return working_directory + "\\Hotline.mp3";
	        case rmSequence8Downstairs: return working_directory + "\\Hydrogen.mp3";
	        case rmSequence9Downstairs: return working_directory + "\\Perturbator.mp3";
	        case rmSequence10Downstairs: return working_directory + "\\Crystals.mp3";
	        case rmSequence11Downstairs: return working_directory + "\\Hotline.mp3";
	        case rmSequence12Downstairs: return working_directory + "\\Hydrogen.mp3";
	        case rmSequence13Downstairs: return working_directory + "\\Knock.mp3";
	        case rmSequence14Downstairs: return working_directory + "\\InnerAnimal.mp3";
	        case rmChapter: return working_directory + "\\TurfMain.mp3";
	    }
	} else {
	    // may be debug? not sure when this is used
	    switch (room) {
	        case rmSequence1Downstairs:
	        case rmSequence2Downstairs:
	        case rmSequence3Downstairs:
	        case rmSequence4Downstairs:
	        case rmSequence5Downstairs:
	        case rmSequence6Downstairs:
	        case rmSequence7Downstairs:
	        case rmSequence8Downstairs:
	        case rmSequence9Downstairs:
	        case rmSequence10Downstairs:
	        case rmSequence11Downstairs:
	        case rmSequence12Downstairs:

	        return working_directory + "\\Daisuke.mp3"
	    }
	}
	switch (argument0) {
	    case rmMCBar: return working_directory + "\\ToTheTop.mp3"
	    case rmMCSequence2Downstairs: return working_directory + "\\Musikk2.mp3"
	    case rmMCSequence3Downstairs: return working_directory + "\\Knock.mp3"
	    case rmMCSequence4Downstairs: return working_directory + "\\InnerAnimal.mp3"
	    case rmNoodleShop: return working_directory + "\\Miami2.mp3"
	    case rmArcadeDownstairs: return working_directory + "\\Miami2.mp3"
	    case rmPhoneHomEntranceBiker: return working_directory + "\\ItsSafeNow.mp3"
	    case rmJanitors: return working_directory + "\\ANewMorning.mp3"
	}

	// Outro to Intro Music
	switch (room) {
	    case rmStore1: case rmStore2: case rmStore3:
	    case rmPizzaHut1: case rmPizzaHut2: case rmPizzaHut3:
	    case rmVideoStore1: case rmVideoStore2: case rmVideoStore3:
	        objEffector.newsong = 0;
	        global.song = working_directory + "\\DeepCover.mp3";
	        break;
        
	    case rmBar1: case rmBar2:
	        objEffector.newsong = 0;
	        global.song = "";
	        break;
        
	    case rmBar3:
	        objEffector.newsong = 0;
	        global.song = working_directory + "\\TurfIntro.mp3";
	        break;
	}



}
