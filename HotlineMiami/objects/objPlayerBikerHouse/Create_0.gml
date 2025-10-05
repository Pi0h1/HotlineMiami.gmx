if (global.xbox)
    scrInitXboxButtons();
image_speed = 0;
dir = 0;
movex = 0;
movey = 0;
move = 0;
viewspeed = 0;
myxspeed = 0;
myyspeed = 0;
myspeed = 0;
reload = 20;
light = 0;
legdir = 0;
legindex = 0;
left = 1;
ammo = 3;
energie = 1;
global.enemy = -1234;
//if (!variable_local_exists("clear"))
clear = 0;
aim = 0;
if (!place_free(x, y)) {
    x = global.executionx;
    y = global.executiony;
}
active = 1;
aimon = 1;
aimfar = 0;
factor = 1;

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
	
	buffer_write(global.tempSave[room], buffer_f32, global.maskindex);
	buffer_write(global.tempSave[room], buffer_f32, global.maskon);

	buffer_write(global.tempSave[room], buffer_f32, ammo);
	buffer_write(global.tempSave[room], buffer_f32, energie);
	buffer_write(global.tempSave[room], buffer_f32, reload);
	buffer_write(global.tempSave[room], buffer_f32, throwreload);
	buffer_write(global.tempSave[room], buffer_f32, light);
	buffer_write(global.tempSave[room], buffer_f32, left);
	buffer_write(global.tempSave[room], buffer_f32, dir);
	
	buffer_write(global.tempSave[room], buffer_f32, movex);
	buffer_write(global.tempSave[room], buffer_f32, movey);
	buffer_write(global.tempSave[room], buffer_f32, move);
	
	buffer_write(global.tempSave[room], buffer_f32, viewspeed);
	buffer_write(global.tempSave[room], buffer_f32, myxspeed);
	buffer_write(global.tempSave[room], buffer_f32, myyspeed);
	buffer_write(global.tempSave[room], buffer_f32, myspeed);
	buffer_write(global.tempSave[room], buffer_f32, legdir);
	buffer_write(global.tempSave[room], buffer_f32, legindex);
	
	buffer_write(global.tempSave[room], buffer_u32, last_sprite);
	buffer_write(global.tempSave[room], buffer_f32, throwindex);
	buffer_write(global.tempSave[room], buffer_u32, masksprite);
	buffer_write(global.tempSave[room], buffer_f32, maskindex);
	buffer_write(global.tempSave[room], buffer_f32, maskon);
	
	buffer_write(global.tempSave[room], buffer_u8, aim);
	buffer_write(global.tempSave[room], buffer_u8, aimfar);
	buffer_write(global.tempSave[room], buffer_u8, aimon);
	
	buffer_write(global.tempSave[room], buffer_f16, factor);
	
	buffer_write(global.tempSave[room], buffer_f32, global.enemy);
	
	buffer_write(global.tempSave[room], buffer_f32, viewdir);
	buffer_write(global.tempSave[room], buffer_f32, vdist);
	buffer_write(global.tempSave[room], buffer_f32, vdir);
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
	
	global.maskindex = buffer_read(global.tempSave[room], buffer_f32);
	global.maskon = buffer_read(global.tempSave[room], buffer_f32);
	
	ammo = buffer_read(global.tempSave[room], buffer_f32);
	energie = buffer_read(global.tempSave[room], buffer_f32);
	reload = buffer_read(global.tempSave[room], buffer_f32);
	throwreload = buffer_read(global.tempSave[room], buffer_f32);
	light = buffer_read(global.tempSave[room], buffer_f32);
	left = buffer_read(global.tempSave[room], buffer_f32);
	dir = buffer_read(global.tempSave[room], buffer_f32);
	
	movex = buffer_read(global.tempSave[room], buffer_f32);
	movey = buffer_read(global.tempSave[room], buffer_f32);
	move = buffer_read(global.tempSave[room], buffer_f32);
	
	viewspeed = buffer_read(global.tempSave[room], buffer_f32);
	myxspeed = buffer_read(global.tempSave[room], buffer_f32);
	myyspeed = buffer_read(global.tempSave[room], buffer_f32);
	myspeed = buffer_read(global.tempSave[room], buffer_f32);
	legdir = buffer_read(global.tempSave[room], buffer_f32);
	legindex = buffer_read(global.tempSave[room], buffer_f32);
	
	last_sprite = buffer_read(global.tempSave[room], buffer_u32);
	throwindex = buffer_read(global.tempSave[room], buffer_f32);
	masksprite = buffer_read(global.tempSave[room], buffer_u32);
	maskindex = buffer_read(global.tempSave[room], buffer_f32);
	maskon = buffer_read(global.tempSave[room], buffer_f32);
	
	aim = buffer_read(global.tempSave[room], buffer_u8);
	aimfar = buffer_read(global.tempSave[room], buffer_u8);
	aimon = buffer_read(global.tempSave[room], buffer_u8);
	
	factor = buffer_read(global.tempSave[room], buffer_f16);
	
	global.enemy = buffer_read(global.tempSave[room], buffer_f32);
	
	viewdir = buffer_read(global.tempSave[room], buffer_f32);
	vdist = buffer_read(global.tempSave[room], buffer_f32);
	vdir = buffer_read(global.tempSave[room], buffer_f32);
}