function scrLoadMask() {
	// mask.nfo is for loading the current mask when the player dies on the first floor.
	// After dying on the first floor, skip all the mask selection stuff
	global.maskindex = global.maskload;
	global.maskon = true;
	with (objPlayer) {
	    scrInitMaskPos();
	    scrUpdateMaskPos(sprite_index);
	    maskon = 1;
	}



}
