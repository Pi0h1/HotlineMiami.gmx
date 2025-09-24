function scrSaveGame(){
//	show_message("Saving game");

	while ( array_length( global.tempSave ) < room ) // incase of dynamically added rooms
		global.tempSave[array_length( global.tempSave )] = buffer_create( 1, buffer_grow, 1 );
	if ( !buffer_exists( global.tempSave[room] ) )
		global.tempSave[room] = buffer_create( 1, buffer_grow, 1 );
		
	buffer_seek( global.tempSave[room], 0, 0 );
	// globals
	buffer_write( global.tempSave[room], buffer_u8, global.done );

	// instances
	with (all) {
		// Don't save object if DoSave doesn't exist.
		if !( self[$ "DoSave" ] )
			continue;
		// Generic values
		buffer_write( global.tempSave[room], buffer_u32, object_index );
		buffer_write( global.tempSave[room], buffer_f32, x );
		buffer_write( global.tempSave[room], buffer_f32, y );
		buffer_write( global.tempSave[room], buffer_f32, depth );
		// Save extra value
		if ( is_method( self[$ "DoSave"] ) ) {
			DoSave();
		}
	}
}

function scrLoadGame(){
	with (all) {
		// Delete instances that were saved
		if ( self[$ "DoSave" ] )
			instance_destroy(self, false);
	}
	var saveLen = buffer_tell( global.tempSave[room] );
	buffer_seek( global.tempSave[room], 0, 0 );
		
	// globals
		global.done = buffer_read( global.tempSave[room], buffer_u8 );
	// instances
	// Load everything in the order you save them!
	while ( buffer_tell( global.tempSave[room] ) < saveLen ) {
		var inst_object_index = buffer_read(global.tempSave[room], buffer_u32 );
		var inst_x = buffer_read(global.tempSave[room], buffer_f32 );
		var inst_y = buffer_read(global.tempSave[room], buffer_f32 );
		var inst_depth = buffer_read(global.tempSave[room], buffer_f32 );
		var inst = instance_create_depth( inst_x, inst_y, inst_depth, inst_object_index );
		if ( is_method( inst.DoLoad ) ) {
			inst.DoLoad();
		}
	}
}