function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths[0] = -1; // player
	global.__objectDepths[1] = 2; // dead_player
	global.__objectDepths[2] = -3; // aim
	global.__objectDepths[3] = 1; // flame
	global.__objectDepths[4] = 0; // bullet
	global.__objectDepths[5] = 1; // blood_splash
	global.__objectDepths[6] = 10; // blood_splat
	global.__objectDepths[7] = 4; // dog_pool
	global.__objectDepths[8] = 4; // blood_pool
	global.__objectDepths[9] = 2; // cartridge
	global.__objectDepths[10] = 0; // smoke
	global.__objectDepths[11] = 0; // smoke2
	global.__objectDepths[12] = 3; // flesh
	global.__objectDepths[13] = 3; // brains
	global.__objectDepths[14] = 4; // blood_small
	global.__objectDepths[15] = 3; // spurt_long
	global.__objectDepths[16] = 1; // flash
	global.__objectDepths[17] = 0; // dog
	global.__objectDepths[18] = 2; // dead_dog
	global.__objectDepths[19] = 2; // splitt_patroller
	global.__objectDepths[20] = -1; // burning_patroller
	global.__objectDepths[21] = -1; // searcher
	global.__objectDepths[22] = -1; // patroller
	global.__objectDepths[23] = 2; // dead_patroller
	global.__objectDepths[24] = 0; // enemy_bullet
	global.__objectDepths[25] = 0; // enemy
	global.__objectDepths[26] = 0; // solid_object
	global.__objectDepths[27] = 0; // moving
	global.__objectDepths[28] = 0; // throwable
	global.__objectDepths[29] = 0; // swingable
	global.__objectDepths[30] = 0; // door
	global.__objectDepths[31] = 0; // pick_up
	global.__objectDepths[32] = 2; // gun_drop
	global.__objectDepths[33] = 1; // sword
	global.__objectDepths[34] = 1; // pipe
	global.__objectDepths[35] = 1; // bat
	global.__objectDepths[36] = 1; // golfclub
	global.__objectDepths[37] = 1; // sledge
	global.__objectDepths[38] = 1; // axe
	global.__objectDepths[39] = 1; // machete
	global.__objectDepths[40] = 1; // woodenboard
	global.__objectDepths[41] = 1; // beercan
	global.__objectDepths[42] = 1; // grenade
	global.__objectDepths[43] = 1; // beer_bottle
	global.__objectDepths[44] = 1; // shattered_bottle
	global.__objectDepths[45] = 0; // wall
	global.__objectDepths[46] = 1; // door_hor_left
	global.__objectDepths[47] = 1; // door_hor_right
	global.__objectDepths[48] = 1; // door_vert_up
	global.__objectDepths[49] = 1; // door_vert_down
	global.__objectDepths[50] = 0; // couch_up
	global.__objectDepths[51] = 0; // toilet
	global.__objectDepths[52] = 0; // couch_down
	global.__objectDepths[53] = 0; // couch_left
	global.__objectDepths[54] = 0; // nightstand
	global.__objectDepths[55] = 0; // bed_left
	global.__objectDepths[56] = 0; // bed_up
	global.__objectDepths[57] = 0; // sound_player
	global.__objectDepths[58] = -999999; // fader
	global.__objectDepths[59] = -1000; // light
	global.__objectDepths[60] = -10; // object60
	global.__objectDepths[61] = -1; // explosion_particle
	global.__objectDepths[62] = 0; // big_particle
	global.__objectDepths[63] = 1; // enemy_pieces
	global.__objectDepths[64] = 2; // blood_draw
	global.__objectDepths[65] = 3; // soot
	global.__objectDepths[66] = 0; // wallsetter


	global.__objectNames[0] = "player";
	global.__objectNames[1] = "dead_player";
	global.__objectNames[2] = "aim";
	global.__objectNames[3] = "flame";
	global.__objectNames[4] = "bullet";
	global.__objectNames[5] = "blood_splash";
	global.__objectNames[6] = "blood_splat";
	global.__objectNames[7] = "dog_pool";
	global.__objectNames[8] = "blood_pool";
	global.__objectNames[9] = "cartridge";
	global.__objectNames[10] = "smoke";
	global.__objectNames[11] = "smoke2";
	global.__objectNames[12] = "flesh";
	global.__objectNames[13] = "brains";
	global.__objectNames[14] = "blood_small";
	global.__objectNames[15] = "spurt_long";
	global.__objectNames[16] = "flash";
	global.__objectNames[17] = "dog";
	global.__objectNames[18] = "dead_dog";
	global.__objectNames[19] = "splitt_patroller";
	global.__objectNames[20] = "burning_patroller";
	global.__objectNames[21] = "searcher";
	global.__objectNames[22] = "patroller";
	global.__objectNames[23] = "dead_patroller";
	global.__objectNames[24] = "enemy_bullet";
	global.__objectNames[25] = "enemy";
	global.__objectNames[26] = "solid_object";
	global.__objectNames[27] = "moving";
	global.__objectNames[28] = "throwable";
	global.__objectNames[29] = "swingable";
	global.__objectNames[30] = "door";
	global.__objectNames[31] = "pick_up";
	global.__objectNames[32] = "gun_drop";
	global.__objectNames[33] = "sword";
	global.__objectNames[34] = "pipe";
	global.__objectNames[35] = "bat";
	global.__objectNames[36] = "golfclub";
	global.__objectNames[37] = "sledge";
	global.__objectNames[38] = "axe";
	global.__objectNames[39] = "machete";
	global.__objectNames[40] = "woodenboard";
	global.__objectNames[41] = "beercan";
	global.__objectNames[42] = "grenade";
	global.__objectNames[43] = "beer_bottle";
	global.__objectNames[44] = "shattered_bottle";
	global.__objectNames[45] = "wall";
	global.__objectNames[46] = "door_hor_left";
	global.__objectNames[47] = "door_hor_right";
	global.__objectNames[48] = "door_vert_up";
	global.__objectNames[49] = "door_vert_down";
	global.__objectNames[50] = "couch_up";
	global.__objectNames[51] = "toilet";
	global.__objectNames[52] = "couch_down";
	global.__objectNames[53] = "couch_left";
	global.__objectNames[54] = "nightstand";
	global.__objectNames[55] = "bed_left";
	global.__objectNames[56] = "bed_up";
	global.__objectNames[57] = "sound_player";
	global.__objectNames[58] = "fader";
	global.__objectNames[59] = "light";
	global.__objectNames[60] = "object60";
	global.__objectNames[61] = "explosion_particle";
	global.__objectNames[62] = "big_particle";
	global.__objectNames[63] = "enemy_pieces";
	global.__objectNames[64] = "blood_draw";
	global.__objectNames[65] = "soot";
	global.__objectNames[66] = "wallsetter";


	// create another array that has the correct entries
	var len = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}
