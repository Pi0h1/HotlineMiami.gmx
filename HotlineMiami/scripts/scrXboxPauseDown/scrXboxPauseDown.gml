function scrXboxPauseDown() {
	if (!on || fade)
	    exit;
	if (select < 2)
	    select++;
	else select = 0;
	if (select == 1 && test == 1)
	    select = 2;



}
