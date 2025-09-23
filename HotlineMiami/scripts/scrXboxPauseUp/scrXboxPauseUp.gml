function scrXboxPauseUp() {
	if (!on || fade)
	    exit;
	if (select > 0)
	    select--;
	else select = 2;
	if (select == 1 && test == 1)
	    select = 0;



}
