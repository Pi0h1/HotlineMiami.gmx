function scrGetMaxpoints() {
	switch (string_upper(global.title)) {
	    case "THE METRO": return 28000;
	    case "NO TALK": return 18000;
	    case "FULL HOUSE": return 60000;
	    case "CLEAN HIT": return 34000;
	    case "NEIGHBOURS": return 58000;
	    case "PUSH IT": return 70000;
	    case "HOT&HEAVY": return 138000;
	    case "VENGEANCE": return 74000;
	    case "OVERDOSE": return 38000;
	    case "DECADENCE": return 47000;
	    case "TENSION": return 50000;
	    case "ASSAULT": return 100000;
	    case "CRACKDOWN": return 68000;
	    case "DEADLINE": return 74000;
	    case "SAFEHOUSE": return 18000;
	    case "FUN&GAMES": return 50000;
	    default: return 40000;
	}



}
