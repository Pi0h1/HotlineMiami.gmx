function scrCarNextInterlude() {
	switch (room) {
	    case rmSequence1Downstairs: return rmStore1;
	    case rmSequence2Downstairs: return rmPizzaHut1;
	    case rmSequence3Downstairs: return rmVideoStore1;
	    case rmSequence4Downstairs: return rmBar1;
    
	    case rmSequence5Downstairs: return rmStore2;
	    case rmSequence6Downstairs: return rmPizzaHut2;
	    case rmSequence7Downstairs: return rmVideoStore2;
	    case rmSequence8Downstairs: return rmBar2;
    
	    case rmSequence9Downstairs: return rmStore3;
	    case rmSequence10Downstairs: return rmPizzaHut3;
	    case rmSequence11Downstairs: return rmVideoStore3;
	    case rmSequence12Downstairs: return rmBar3;
    
	    case rmStore1:
	    case rmPizzaHut1:
	    case rmVideoStore1:
	    case rmBar1:
    
	    case rmStore2:
	    case rmPizzaHut2:
	    case rmVideoStore2:
	    case rmBar2:
    
	    case rmStore3:
	    case rmPizzaHut3:
	    case rmVideoStore3:
	    case rmBar3:
    
	    revisit = 1;
	    return global.sequence;
	}



}
