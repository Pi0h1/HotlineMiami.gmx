function showLoaded() {
//	show_debug_message("global.loaded = ");
	return "global.loaded = " + string(global.loaded);
}

// You must save globals in the same order they are loaded!
// They must also have matching data types (i.e. buffer_f32)
function scrSaveGlobals(buf) {
	buffer_write( buf, buffer_f32, camera_get_view_x(view_camera[0]) );
	buffer_write( buf, buffer_f32, camera_get_view_y(view_camera[0]) );
	
	buffer_write( buf, buffer_u8, global.done );
	buffer_write( buf, buffer_f16, global.factor );
	buffer_write( buf, buffer_u8, global.test );
	buffer_write( buf, buffer_u8, global.noguns );
	buffer_write( buf, buffer_u8, global.talked );
	
	// trauma
	if (variable_global_exists("doctor")) {
		buffer_write( buf, buffer_f32, global.doctor );
	}
	
	// letters
	var len = array_length(global.letter) ;
	buffer_write( global.tempSave[room], buffer_u16, len );
	for (var i = 0; i < len; ++i) {
		buffer_write( global.tempSave[room], buffer_u16, global.letter[i]);
	}
	
	// masks
	buffer_write( global.tempSave[room], buffer_u16, global.newmasks );
	
	var len = array_length(global.masks) ;
	buffer_write( global.tempSave[room], buffer_u16, len );
	for (var i = 0; i < len; ++i) {
		buffer_write( global.tempSave[room], buffer_u16, global.masks[i]);
	}
	// new masks array
	var len = array_length(global.newmasks) ;
	buffer_write( global.tempSave[room], buffer_u16, len );
	for (var i = 0; i < len; ++i) {
		buffer_write( global.tempSave[room], buffer_u16, global.newmasks[i]);
	}
}

// You must load globals in the same order you save them!
// They must also have matching data types (i.e. buffer_f32)
function scrLoadGlobals(buf) {	
	var loadedCamX = buffer_read( buf, buffer_f32 );
	var loadedCamY = buffer_read( buf, buffer_f32 );
	camera_set_view_pos(view_camera[0], loadedCamX, loadedCamY);

	global.done = buffer_read( buf, buffer_u8 );
	global.factor = buffer_read( buf, buffer_f16 );
	global.test = buffer_read( buf, buffer_u8 );
	global.noguns = buffer_read( buf, buffer_u8 );
	global.talked = buffer_read( buf, buffer_u8 );
	
	// trauma
	if (variable_global_exists("doctor")) {
		global.doctor = buffer_read( buf, buffer_f32 );
	}
	
	// letters
	var len = buffer_read(global.tempSave[room], buffer_u16 );
	for (i = 0; i < len; ++i) {
		global.letter[i] = buffer_read( global.tempSave[room], buffer_u16);
	}
	
	// masks
	global.newmasks = buffer_read(global.tempSave[room], buffer_u16 );
	var len = buffer_read(global.tempSave[room], buffer_u16 );
	for (i = 0; i < len; ++i) {
		global.masks[i] = buffer_read( global.tempSave[room], buffer_u16);
	}
	// new masks array
	var len = buffer_read(global.tempSave[room], buffer_u16 );
	for (i = 0; i < len; ++i) {
		global.newmasks[i] = buffer_read( global.tempSave[room], buffer_u16);
	}
}

// You can call this script to add onto DoSave().
function scrSaveGeneric(buf) {
	buffer_write( buf, buffer_u32, sprite_index );
	buffer_write( buf, buffer_f32, image_index );
	buffer_write( buf, buffer_f16, image_speed );
	buffer_write( buf, buffer_f16, image_xscale );
	buffer_write( buf, buffer_f16, image_yscale );
	buffer_write( buf, buffer_f32, image_angle );
	buffer_write( buf, buffer_f32, image_blend );
	buffer_write( buf, buffer_f16, image_alpha );
	buffer_write( buf, buffer_f32, friction );
	buffer_write( buf, buffer_f32, speed );
	buffer_write( buf, buffer_f32, direction );
	buffer_write( buf, buffer_u8, visible );
}

// Same for DoLoad()
function scrLoadGeneric(buf) {
	sprite_index = buffer_read(buf, buffer_u32 );
	image_index = buffer_read(buf, buffer_f32 );
	image_speed = buffer_read(buf, buffer_f16 );
	image_xscale = buffer_read(buf, buffer_f16 );
	image_yscale = buffer_read(buf, buffer_f16 );
	image_angle = buffer_read(buf, buffer_f32 );
	image_blend = buffer_read(buf, buffer_f32 );
	image_alpha = buffer_read(buf, buffer_f16 );
	friction = buffer_read(buf, buffer_f32 );
	speed = buffer_read(buf, buffer_f32 );
	direction = buffer_read(buf, buffer_f32 );
	visible = buffer_read(buf, buffer_u8 );
}

function checkpoint_save(file) {
	//game_save(file);
//	global.loaded = 1;
	scrSaveGame(global.tempSave[room]);
//	global.loaded = 0;
	show_debug_message("SAVED: " + file);
}

function checkpoint_load(file){
	//game_load(file);
	scrLoadGame(global.tempSave[room]);
	global.loaded = 1;
	showLoaded();
	show_debug_message("LOADED: " + file);
}

function restart_create(file){
	//game_save(file);
	scrSaveGame(global.tempSave[room]);
	global.maskload = -1;
	show_debug_message("SAVED: " + file);
}

function restart_load(file){
	//game_load(file);
	scrLoadGame(global.tempSave[room]);
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

function scrSaveGame(buf){
	buf ??= global.tempSave[room];

	if ( room > array_length( global.tempSave ) || (!buffer_exists( global.tempSave[room] ) )) {
		buf = buffer_create(1, buffer_grow, 1);
		global.tempSave[room] = buf;
	}
	
	buffer_seek( buf, 0, 0 );
	
	scrSaveGlobals(buf);

	// instances
	with (all) {
		// Don't save object if DoSave doesn't exist.
		if !( self[$ "DoSave" ] )
			continue;
		// Generic values
		buffer_write( buf, buffer_u32, object_index );
		buffer_write( buf, buffer_f32, x );
		buffer_write( buf, buffer_f32, y );
		buffer_write( buf, buffer_f32, depth );
		show_debug_message(object_get_name(object_index));
		// Save extra value	
		if ( is_method( self[$ "DoSave"] ) ) {
			DoSave(buf);
		}
	}
}

function scrLoadGame(buf ){
	buf ??= global.tempSave[room];
	with (all) {
		// Delete instances that were saved
		if ( self[$ "DoSave" ] )
			instance_destroy(self, false);
	}
	var saveLen = buffer_tell( buf );
	buffer_seek( buf, 0, 0 );
	
	scrLoadGlobals(buf);
	
	// instances
	// Load everything in the order you save them!
	while ( buffer_tell( buf ) < saveLen ) {
		var inst_object_index = buffer_read(buf, buffer_u32 );
		var inst_x = buffer_read(buf, buffer_f32 );
		var inst_y = buffer_read(buf, buffer_f32 );
		var inst_depth = buffer_read(buf, buffer_f32 );
		var inst = instance_create_depth( inst_x, inst_y, inst_depth, inst_object_index );
		inst.x = inst_x;
		inst.y = inst_y;
		if ( is_method( inst.DoLoad ) ) {
			inst.DoLoad(buf);
		}
	}
	
	// recreate mp grid for path finding
	scrInitPathFinding();
}