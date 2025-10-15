if (global.xbox == 1) {
    scrInitXboxButtons();
}
image_speed = 0;
dir = 0;
aimon = 1;
aimfar = 0;
aim = 0;
viewspeed = 0;
reload = 0;
light = 0;
legdir = 0;
legindex = 0;
left = 1;
ammo = 0;
energie = 1;
throwreload = 0;
scrInitThrowPos();
scrInitMaskPos();
throwindex = 0;
alarm[0] = 18;
last_sprite = sprite_index;
maskon = 0;
maskindex = 0;
previousx = x;
previousy = y;
active = 1;
viewdir = 0;
vdist = 0;
vdir = 0;
valid = 1;
factor = 1;

if (room == rmSequence13Downstairs)
    active = 0;
myxspeed = 0;
myyspeed = 0;
myspeed = 0;

if (room == rmSecretSewer) {
    maskon = 1;
    maskindex = global.maskindex;
    global.maskon = 1;
}

DoSave = function(buf) {
	
	// save xbox vars
	// NOTE: THIS WILL BREAK IF GLOBAL.XBOX IS CHANGED INGAME.
	if (global.xbox) {
		buffer_write( buf, buffer_f32, presstart );
		buffer_write( buf, buffer_f32, pressup );
		buffer_write( buf, buffer_f32, pressdown );
		buffer_write( buf, buffer_f32, pressleft );
		buffer_write( buf, buffer_f32, pressright );
		buffer_write( buf, buffer_f32, pressback );
		buffer_write( buf, buffer_f32, pressltrig );
		buffer_write( buf, buffer_f32, pressrtrig );
		buffer_write( buf, buffer_f32, presslb );
		buffer_write( buf, buffer_f32, pressrb );
		buffer_write( buf, buffer_f32, pressrstick );
		buffer_write( buf, buffer_f32, presslstick );
		buffer_write( buf, buffer_f32, pressa );
	}

	// basic vars
	scrSaveGeneric(buf);
	
	buffer_write(buf, buffer_f32, global.maskindex);
	buffer_write(buf, buffer_f32, global.maskon);
	
	buffer_write(buf, buffer_f32, alarm[0]);

	buffer_write(buf, buffer_f32, ammo);
	buffer_write(buf, buffer_f32, energie);
	buffer_write(buf, buffer_f32, reload);
	buffer_write(buf, buffer_f32, throwreload);
	buffer_write(buf, buffer_f32, light);
	buffer_write(buf, buffer_s8, left);
	buffer_write(buf, buffer_f32, dir);
	
	buffer_write(buf, buffer_f32, viewspeed);
	buffer_write(buf, buffer_f32, myxspeed);
	buffer_write(buf, buffer_f32, myyspeed);
	buffer_write(buf, buffer_f32, myspeed);
	buffer_write(buf, buffer_f32, legdir);
	buffer_write(buf, buffer_f32, legindex);
	
	buffer_write(buf, buffer_u32, last_sprite);
	buffer_write(buf, buffer_f16, throwindex);
	buffer_write(buf, buffer_f16, maskindex);
	buffer_write(buf, buffer_u8, maskon);
	
	buffer_write(buf, buffer_u8, aim);
	buffer_write(buf, buffer_u8, aimfar);
	buffer_write(buf, buffer_u8, aimon);
	
	buffer_write(buf, buffer_f16, factor);
	
	buffer_write(buf, buffer_f32, viewdir);
	buffer_write(buf, buffer_f32, vdist);
	buffer_write(buf, buffer_f32, vdir);
	
	buffer_write(buf, buffer_u8, active);
	buffer_write(buf, buffer_u8, valid);
	
	buffer_write(buf, buffer_f32, previousx);
	buffer_write(buf, buffer_f32, previousy);
}
// Everything must be loaded in the same order you save them, as well as the same read type!
DoLoad = function(buf) {

	// load xbox vars
	// NOTE: THIS WILL BREAK IF GLOBAL.XBOX IS CHANGED INGAME.
	if (global.xbox) {
		presstart = buffer_read(buf, buffer_f32 );
		pressup = buffer_read(buf, buffer_f32 );
		pressdown = buffer_read(buf, buffer_f32 );
		pressleft = buffer_read(buf, buffer_f32 );
		pressright = buffer_read(buf, buffer_f32 );
		pressback = buffer_read(buf, buffer_f32 );
		pressltrig = buffer_read(buf, buffer_f32 );
		pressrtrig = buffer_read(buf, buffer_f32 );
		presslb = buffer_read(buf, buffer_f32 );
		pressrb = buffer_read(buf, buffer_f32 );
		pressrstick = buffer_read(buf, buffer_f32 );
		presslstick = buffer_read(buf, buffer_f32 );
		pressa = buffer_read(buf, buffer_f32 );
	}

	// basic vars
	scrLoadGeneric(buf);
	
	global.maskindex = buffer_read(buf, buffer_f32);
	global.maskon = buffer_read(buf, buffer_f32);
	
	alarm[0] = buffer_read(buf, buffer_f32);
	
	ammo = buffer_read(buf, buffer_f32);
	energie = buffer_read(buf, buffer_f32);
	reload = buffer_read(buf, buffer_f32);
	throwreload = buffer_read(buf, buffer_f32);
	light = buffer_read(buf, buffer_f32);
	left = buffer_read(buf, buffer_s8);
	dir = buffer_read(buf, buffer_f32);
	
	viewspeed = buffer_read(buf, buffer_f32);
	myxspeed = buffer_read(buf, buffer_f32);
	myyspeed = buffer_read(buf, buffer_f32);
	myspeed = buffer_read(buf, buffer_f32);
	legdir = buffer_read(buf, buffer_f32);
	legindex = buffer_read(buf, buffer_f32);
	
	last_sprite = buffer_read(buf, buffer_u32);
	throwindex = buffer_read(buf, buffer_f16);
	maskindex = buffer_read(buf, buffer_f16);
	maskon = buffer_read(buf, buffer_u8);
	
	aim = buffer_read(buf, buffer_u8);
	aimfar = buffer_read(buf, buffer_u8);
	aimon = buffer_read(buf, buffer_u8);
	
	factor = buffer_read(buf, buffer_f16);
	
	viewdir = buffer_read(buf, buffer_f32);
	vdist = buffer_read(buf, buffer_f32);
	vdir = buffer_read(buf, buffer_f32);
	
	active = buffer_read(buf, buffer_u8);
	valid = buffer_read(buf, buffer_u8);
	
	previousx = buffer_read(buf, buffer_f32);
	previousy = buffer_read(buf, buffer_f32);
}