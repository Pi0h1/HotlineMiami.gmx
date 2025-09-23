function scrEnemyIsAttacking() {
	switch (sprite_index) {
	    case sprEAttackBat: return true;
	    case sprEAttackKnife: return true;
	    case sprEAttackPipe: return true;
	    case sprEAttackClub: return true;
	    default: return false;
	}



}
