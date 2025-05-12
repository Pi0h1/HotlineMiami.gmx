function scrSaveGame(){
//	show_message("Saving game");
	buffer_seek( global.tempSave, 0, 0 );
	// globals
	buffer_write( global.tempSave, buffer_u8, global.done );

	// instances
	with (all) {
		// Don't save object if DoSave doesn't exist.
		if !( self[$ "DoSave" ] )
			continue;
		// Generic values
		buffer_write( global.tempSave, buffer_u32, object_index );
		buffer_write( global.tempSave, buffer_f32, x );
		buffer_write( global.tempSave, buffer_f32, y );
		buffer_write( global.tempSave, buffer_f32, depth );
		// Save extra values
		if ( is_method( self[$ "DoSave"] ) ) {
			DoSave();
		}
	}
	/*
	var file = working_directory+"\\tempsave.sav";	
	scrSaveFurniture();
	scrSaveEnemies();
	scrSavePlayer();
	scrSaveEffector();
	scrSaveCurrentSurface();
	scrSaveSurfaceManager();
	scrSaveScore();
	scrSaveMisc();
*/	
}