if (global.xbox)
    scrInitXboxButtons();
image_speed = 0;
dir = 0;
viewspeed = 0;
reload = 0;
light = 0;
legdir = 0;
legindex = 0;
left = 1;
ammo = 0;
energie = 1;
throwreload = 0;
active = 1;
myxspeed = 0;
myyspeed = 0;
myspeed = 0;
last_sprite = sprPWalkHospital;
camera_set_view_pos(view_camera[0], x - camera_get_view_width(view_camera[0]) / 2, y - camera_get_view_height(view_camera[0]) / 2);
xview = camera_get_view_x(view_camera[0]);
yview = camera_get_view_y(view_camera[0]);
alarm[1] = 2;
aimfar = 0;
factor = 1;
vdist = 0;
vdir = 0;
viewdir = 0;

DoSave = function() {
	
	// save xbox vars
	// NOTE: THIS WILL BREAK IF GLOBAL.XBOX IS CHANGED INGAME.
	if (global.xbox) {
		buffer_write( global.tempSave[room], buffer_f32, presstart );
		buffer_write( global.tempSave[room], buffer_f32, pressup );
		buffer_write( global.tempSave[room], buffer_f32, pressdown );
		buffer_write( global.tempSave[room], buffer_f32, pressleft );
		buffer_write( global.tempSave[room], buffer_f32, pressright );
		buffer_write( global.tempSave[room], buffer_f32, pressback );
		buffer_write( global.tempSave[room], buffer_f32, pressltrig );
		buffer_write( global.tempSave[room], buffer_f32, pressrtrig );
		buffer_write( global.tempSave[room], buffer_f32, presslb );
		buffer_write( global.tempSave[room], buffer_f32, pressrb );
		buffer_write( global.tempSave[room], buffer_f32, pressrstick );
		buffer_write( global.tempSave[room], buffer_f32, presslstick );
		buffer_write( global.tempSave[room], buffer_f32, pressa );
	}

	// basic vars
	scrSaveGeneric(global.tempSave[room]);

	buffer_write(global.tempSave[room], buffer_f32, ammo);
	buffer_write(global.tempSave[room], buffer_f32, energie);
	buffer_write(global.tempSave[room], buffer_f32, reload);
	buffer_write(global.tempSave[room], buffer_f32, throwreload);
	buffer_write(global.tempSave[room], buffer_f32, light);
	buffer_write(global.tempSave[room], buffer_f32, left);
	buffer_write(global.tempSave[room], buffer_f32, dir);
	
	buffer_write(global.tempSave[room], buffer_f32, viewspeed);
	buffer_write(global.tempSave[room], buffer_f32, myxspeed);
	buffer_write(global.tempSave[room], buffer_f32, myyspeed);
	buffer_write(global.tempSave[room], buffer_f32, myspeed);
	buffer_write(global.tempSave[room], buffer_f32, legdir);
	buffer_write(global.tempSave[room], buffer_f32, legindex);
	
	buffer_write(global.tempSave[room], buffer_u32, last_sprite);
	buffer_write(global.tempSave[room], buffer_u8, aimfar);	
	buffer_write(global.tempSave[room], buffer_f16, factor);

	buffer_write(global.tempSave[room], buffer_f32, viewdir);
	buffer_write(global.tempSave[room], buffer_f32, vdist);
	buffer_write(global.tempSave[room], buffer_f32, vdir);
	
	buffer_write(global.tempSave[room], buffer_f32, active);
}
// Everything must be loaded in the same order you save them, as well as the same read type!
DoLoad = function() {

	// load xbox vars
	// NOTE: THIS WILL BREAK IF GLOBAL.XBOX IS CHANGED INGAME.
	if (global.xbox) {
		presstart = buffer_read(global.tempSave[room], buffer_f32 );
		pressup = buffer_read(global.tempSave[room], buffer_f32 );
		pressdown = buffer_read(global.tempSave[room], buffer_f32 );
		pressleft = buffer_read(global.tempSave[room], buffer_f32 );
		pressright = buffer_read(global.tempSave[room], buffer_f32 );
		pressback = buffer_read(global.tempSave[room], buffer_f32 );
		pressltrig = buffer_read(global.tempSave[room], buffer_f32 );
		pressrtrig = buffer_read(global.tempSave[room], buffer_f32 );
		presslb = buffer_read(global.tempSave[room], buffer_f32 );
		pressrb = buffer_read(global.tempSave[room], buffer_f32 );
		pressrstick = buffer_read(global.tempSave[room], buffer_f32 );
		presslstick = buffer_read(global.tempSave[room], buffer_f32 );
		pressa = buffer_read(global.tempSave[room], buffer_f32 );
	}

	// basic vars
	scrLoadGeneric(global.tempSave[room]);
	
	ammo = buffer_read(global.tempSave[room], buffer_f32);
	energie = buffer_read(global.tempSave[room], buffer_f32);
	reload = buffer_read(global.tempSave[room], buffer_f32);
	throwreload = buffer_read(global.tempSave[room], buffer_f32);
	light = buffer_read(global.tempSave[room], buffer_f32);
	left = buffer_read(global.tempSave[room], buffer_f32);
	dir = buffer_read(global.tempSave[room], buffer_f32);
	
	viewspeed = buffer_read(global.tempSave[room], buffer_f32);
	myxspeed = buffer_read(global.tempSave[room], buffer_f32);
	myyspeed = buffer_read(global.tempSave[room], buffer_f32);
	myspeed = buffer_read(global.tempSave[room], buffer_f32);
	legdir = buffer_read(global.tempSave[room], buffer_f32);
	legindex = buffer_read(global.tempSave[room], buffer_f32);
	
	last_sprite = buffer_read(global.tempSave[room], buffer_u32);
	aimfar = buffer_read(global.tempSave[room], buffer_u8);
	factor = buffer_read(global.tempSave[room], buffer_f16);
	
	viewdir = buffer_read(global.tempSave[room], buffer_f32);
	vdist = buffer_read(global.tempSave[room], buffer_f32);
	vdir = buffer_read(global.tempSave[room], buffer_f32);
	
	active = buffer_read(global.tempSave[room], buffer_f32);
}