function scrXboxEndingDialogue2Start() {
	if (reload > 0)
	    exit;
	reload = 2;
	if (current < messages) {
	    if (face[current] > face[current + 1])
	        change = 1;
	    if (face[current] < face[current + 1])
	        change = 1;
	    current++;
	} else {
	    stop = 1;
	}



}
