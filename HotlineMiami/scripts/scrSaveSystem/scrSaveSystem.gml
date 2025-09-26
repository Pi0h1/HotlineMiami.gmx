// You can call this script to add onto DoSave().
function scrSaveGeneric(buff) {
	buffer_write( buff, buffer_u32, sprite_index );
	buffer_write( buff, buffer_f32, image_index );
	buffer_write( buff, buffer_f32, image_speed );
	buffer_write( buff, buffer_f32, image_xscale );
	buffer_write( buff, buffer_f32, image_yscale );
	buffer_write( buff, buffer_f32, image_angle );
	buffer_write( buff, buffer_f32, image_blend );
	buffer_write( buff, buffer_f32, image_alpha );
	buffer_write( buff, buffer_f32, friction );
	buffer_write( buff, buffer_f32, speed );
	buffer_write( buff, buffer_f32, direction );
}

// Same for DoLoad()
function scrLoadGeneric(buff) {
	sprite_index = buffer_read(buff, buffer_u32 );
	image_index = buffer_read(buff, buffer_f32 );
	image_speed = buffer_read(buff, buffer_f32 );
	image_xscale = buffer_read(buff, buffer_f32 );
	image_yscale = buffer_read(buff, buffer_f32 );
	image_angle = buffer_read(buff, buffer_f32 );
	image_blend = buffer_read(buff, buffer_f32 );
	image_alpha = buffer_read(buff, buffer_f32 );
	friction = buffer_read(buff, buffer_f32 );
	speed = buffer_read(buff, buffer_f32 );
	direction = buffer_read(buff, buffer_f32 );
}

function checkpoint_save(file) {
	//game_save(file);
	scrSaveGame();
	show_debug_message("SAVED: " + file);
}

function checkpoint_load(file){
	//game_load(file);
	scrLoadGame();
	show_debug_message("LOADED: " + file);
}

function restart_create(file){
	//game_save(file);
	scrSaveGame();
	global.maskload = -1;
	show_debug_message("SAVED: " + file);
}

function restart_load(file){
	//game_load(file);
	scrLoadGame();
	global.maskload = -1;
	show_debug_message("LOADED RESTART: " + file);
}

// In case you don't plan on saving any variables specifically.
function addToSave() {
	DoSave = true;
	DoLoad = true;
}

// same purpose as addToSave() but saves more generic variables.
function addToSaveExt() {
	DoSave = scrSaveGeneric;
	DoLoad = scrLoadGeneric;
}

function scrSaveGame(){
//	show_message("Saving game");

	while ( array_length( global.tempSave ) < room ) // incase of dynamically added rooms
		global.tempSave[array_length( global.tempSave )] = buffer_create( 1, buffer_grow, 1 );
	if ( !buffer_exists( global.tempSave[room] ) )
		global.tempSave[room] = buffer_create( 1, buffer_grow, 1 );
		
	buffer_seek( global.tempSave[room], 0, 0 );
	// globals
	buffer_write( global.tempSave[room], buffer_u8, global.done );
	buffer_write( global.tempSave[room], buffer_u8, global.noguns );

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
		global.noguns = buffer_read( global.tempSave[room], buffer_u8 );
	// instances
	// Load everything in the order you save them!
	while ( buffer_tell( global.tempSave[room] ) < saveLen ) {
		var inst_object_index = buffer_read(global.tempSave[room], buffer_u32 );
		var inst_x = buffer_read(global.tempSave[room], buffer_f32 );
		var inst_y = buffer_read(global.tempSave[room], buffer_f32 );
		var inst_depth = buffer_read(global.tempSave[room], buffer_f32 );
		var inst = instance_create_depth( inst_x, inst_y, inst_depth, inst_object_index );
		inst.x = inst_x;
		inst.y = inst_y;
		if ( is_method( inst.DoLoad ) ) {
			inst.DoLoad();
		}
	}
}