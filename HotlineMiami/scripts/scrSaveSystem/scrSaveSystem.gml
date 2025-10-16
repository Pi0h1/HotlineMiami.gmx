// You must save globals in the same order they are loaded!
// They must also have matching data types (i.e. buffer_f32)
function scrSaveGlobals(buf) {
	buffer_write( buf, buffer_f32, camera_get_view_x(view_camera[0]) );
	buffer_write( buf, buffer_f32, camera_get_view_y(view_camera[0]) );
	
	// scores
	buffer_write( buf, buffer_f32, global.myscore );
	buffer_write( buf, buffer_f32, global.killscore );
	buffer_write( buf, buffer_f32, global.boldscore );
	buffer_write( buf, buffer_f32, global.timescore );
	buffer_write( buf, buffer_f32, global.flexibilityscore );
	buffer_write( buf, buffer_f32, global.mobilityscore );
	buffer_write( buf, buffer_f32, global.specialscore );
	buffer_write( buf, buffer_f32, global.drawscore );
	buffer_write( buf, buffer_f32, global.combo );
	buffer_write( buf, buffer_f32, global.combotime );
	buffer_write( buf, buffer_f32, global.comboscore );
	buffer_write( buf, buffer_f32, global.gunkill );
	buffer_write( buf, buffer_u8, global.noguns );
	buffer_write( buf, buffer_u8, global.barehanded );
	buffer_write( buf, buffer_u8, global.switchweapon );
	buffer_write( buf, buffer_u8, global.neverseen );
	buffer_write( buf, buffer_u8, global.nomiss );
	buffer_write( buf, buffer_u8, global.oneweapon );
	buffer_write( buf, buffer_u8, global.punchonly );
	buffer_write( buf, buffer_f32, global.time );
	// flexibility
	var len = array_length(global.flexibility) ;
	buffer_write( buf, buffer_u16, len );
	for (var i = 0; i < len; ++i) {
		buffer_write( buf, buffer_u8, global.flexibility[i]);
	}
	// global.kills
	var len = array_length(global.killx);
	buffer_write( buf, buffer_u16, len );
	for (var i = 0; i < len; ++i) {
		buffer_write( buf, buffer_f32, global.killx[i]);
		buffer_write( buf, buffer_f32, global.killy[i]);
	}
	buffer_write( buf, buffer_f32, global.kills );
	// global.bonuslist
	var len = ds_list_size(global.bonuslist);
	buffer_write( buf, buffer_u16, len );
	for (var i = 0; i < len; i++) {
		buffer_write( buf, buffer_string, global.bonuslist[| i]);
	}
	
	// misc
	buffer_write( buf, buffer_u8, global.done );
	buffer_write( buf, buffer_f16, global.factor );
	buffer_write( buf, buffer_u8, global.test );
	buffer_write( buf, buffer_u8, global.noguns );
	buffer_write( buf, buffer_u8, global.talked );
	buffer_write( buf, buffer_f32, global.bonustime );
	
	// trauma
	if (variable_global_exists("doctor")) {
		buffer_write( buf, buffer_f32, global.doctor );
	}
	
	// letters
	var len = array_length(global.letter) ;
	buffer_write( buf, buffer_u16, len );
	for (var i = 0; i < len; ++i) {
		buffer_write( buf, buffer_u16, global.letter[i]);
	}
	
	// masks
	var len = array_length(global.masks) ;
	buffer_write( buf, buffer_u16, len );
	for (var i = 0; i < len; ++i) {
		buffer_write( buf, buffer_u16, global.masks[i]);
	}
	// new mask array
	buffer_write( buf, buffer_u16, global.newmasks );
	var len = array_length(global.newmask) ;
	buffer_write( buf, buffer_u16, len );
	for (var i = 0; i < len; ++i) {
		buffer_write( buf, buffer_u16, global.newmask[i]);
	}
}

// You must load globals in the same order you save them!
// They must also have matching data types (i.e. buffer_f32)
function scrLoadGlobals(buf) {	
	var loadedCamX = buffer_read( buf, buffer_f32 );
	var loadedCamY = buffer_read( buf, buffer_f32 );
	camera_set_view_pos(view_camera[0], loadedCamX, loadedCamY);
	
	// scores
	global.myscore = buffer_read( buf, buffer_f32 );
	global.killscore = buffer_read( buf, buffer_f32 );
	global.boldscore = buffer_read( buf, buffer_f32 );
	global.timescore = buffer_read( buf, buffer_f32 );
	global.flexibilityscore = buffer_read( buf, buffer_f32 );
	global.mobilityscore = buffer_read( buf, buffer_f32 );
	global.specialscore = buffer_read( buf, buffer_f32 );
	global.drawscore = buffer_read( buf, buffer_f32 );
	global.combo = buffer_read( buf, buffer_f32 );
	global.combotime = buffer_read( buf, buffer_f32 );
	global.comboscore = buffer_read( buf, buffer_f32 );
	global.gunkill = buffer_read( buf, buffer_f32 );
	global.noguns = buffer_read( buf, buffer_u8 );
	global.barehanded = buffer_read( buf, buffer_u8 );
	global.switchweapon = buffer_read( buf, buffer_u8 );
	global.neverseen = buffer_read( buf, buffer_u8 );
	global.nomiss = buffer_read( buf, buffer_u8 );
	global.oneweapon = buffer_read( buf, buffer_u8 );
	global.punchonly = buffer_read( buf, buffer_u8 );
	global.time = buffer_read( buf, buffer_f32 );
	// flexibility
	var len = buffer_read(buf, buffer_u16 );
	for (i = 0; i < len; ++i) {
		global.flexibility[i] = buffer_read( buf, buffer_u8);
	}
	// global.killx
	var len = buffer_read(buf, buffer_u16 );
	for (i = 0; i < len; ++i) {
		global.killx[i] = buffer_read( buf, buffer_f32);
		global.killy[i] = buffer_read( buf, buffer_f32);
	}
	global.kills = buffer_read( buf, buffer_f32 );
	// global.bonuslist
	ds_list_clear(global.bonuslist);
	var len = buffer_read(buf, buffer_u16 );
	for (i = 0; i < len; ++i) {
		ds_list_add(global.bonuslist, buffer_read( buf, buffer_string));
	}
	
	// misc
	global.done = buffer_read( buf, buffer_u8 );
	global.factor = buffer_read( buf, buffer_f16 );
	global.test = buffer_read( buf, buffer_u8 );
	global.noguns = buffer_read( buf, buffer_u8 );
	global.talked = buffer_read( buf, buffer_u8 );
	global.bonustime = buffer_read( buf, buffer_f32 );
	
	// trauma
	if (variable_global_exists("doctor")) {
		global.doctor = buffer_read( buf, buffer_f32 );
	}
	
	// letters
	var len = buffer_read(buf, buffer_u16 );
	for (i = 0; i < len; ++i) {
		global.letter[i] = buffer_read( buf, buffer_u16);
	}
	
	// masks
	var len = buffer_read(buf, buffer_u16 );
	for (i = 0; i < len; ++i) {
		global.masks[i] = buffer_read( buf, buffer_u16);
	}
	// new masks array
	global.newmasks = buffer_read(buf, buffer_u16 );
	var len = buffer_read(buf, buffer_u16 );
	for (i = 0; i < len; ++i) {
		global.newmask[i] = buffer_read( buf, buffer_u16);
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
	scrSaveGame(global.tempSave[room]);
	show_debug_message("SAVED: " + file);
}

function checkpoint_load(file){
	//game_load(file);
	scrLoadGame(global.tempSave[room]);
	global.loaded = 1;
	show_debug_message("LOADED: " + file);
}

function restart_load(file){
	with (objGame) {
		// you may need to change this number if you reoriented the rooms at any point or get an error here.
		roomRestartIndex = 3;
	}
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

function reset_tempSave(){
    for ( var i = 0; i < array_length(global.tempSave); ++i) {
        var buf = global.tempSave[i];
        if ( buffer_exists( buf ) )
        {
            global.tempSave[i] = -1;
            buffer_delete( buf );
        }
    }
}