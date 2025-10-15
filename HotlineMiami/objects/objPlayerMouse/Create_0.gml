if (global.xbox) {
    scrInitXboxButtons();
}

if (room == rmTutorial) {
    global.maskindex = 3;
    global.maskon = 1;
    global.done = 1;
}

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
ammo = 0;
viewdir = 0;
vdist = 0;
vdir = 0;

// Default health value
energie = round(random(1));
// Set health if using a specific mask
if (global.maskon == 1) {
    if (global.maskindex == 9) 
        energie = 1;
    if (global.maskindex == 21) 
        energie = 2;
}

throwreload = 0;

scrInitThrowPos();
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);

last_sprite = sprite_index;
throwindex = 0;
masksprite = -1;
maskindex = global.maskindex;
maskon = global.maskon;
release = 0;
shieldwait = 0;
aim = 0;
aimfar = 0;
factor = 1;

global.enemy = -1234; // for lock-on

// if clear isn't initialized, initialize it now.
// likely when objPlayerMouse is recreated when a floor is clear (i.e. objPlayerMouseHouse to objPlayerMouse)
if (!variable_local_exists("clear"))
	clear = 0;
    
if (!place_free(x,y)) {
    x = global.executionx;
    y = global.executiony;
}

// See scrSaveGame() and scrLoadGame() for details regarding restarting a floor.
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

	buffer_write(buf, buffer_f32, ammo);
	buffer_write(buf, buffer_f32, energie);
	buffer_write(buf, buffer_f32, reload);
	buffer_write(buf, buffer_f32, throwreload);
	buffer_write(buf, buffer_f32, light);
	buffer_write(buf, buffer_s8, left);
	buffer_write(buf, buffer_f32, dir);
	
	buffer_write(buf, buffer_f32, movex);
	buffer_write(buf, buffer_f32, movey);
	buffer_write(buf, buffer_f32, move);
	
	buffer_write(buf, buffer_f32, viewspeed);
	buffer_write(buf, buffer_f32, myxspeed);
	buffer_write(buf, buffer_f32, myyspeed);
	buffer_write(buf, buffer_f32, myspeed);
	buffer_write(buf, buffer_f32, legdir);
	buffer_write(buf, buffer_f16, legindex);
	
	buffer_write(buf, buffer_u32, last_sprite);
	buffer_write(buf, buffer_f32, throwindex);
	buffer_write(buf, buffer_u32, masksprite);
	buffer_write(buf, buffer_f16, maskindex);
	buffer_write(buf, buffer_u8, maskon);
	
	buffer_write(buf, buffer_f32, release);
	buffer_write(buf, buffer_f32, shieldwait);
	buffer_write(buf, buffer_f32, clear);
	buffer_write(buf, buffer_u8, aim);
	buffer_write(buf, buffer_u8, aimfar);
	buffer_write(buf, buffer_f16, factor);
	
	buffer_write(buf, buffer_u8, persistent);
	
	buffer_write(buf, buffer_f32, global.enemy);
	
	buffer_write(buf, buffer_f32, viewdir);
	buffer_write(buf, buffer_f32, vdist);
	buffer_write(buf, buffer_f32, vdir);
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
	
	ammo = buffer_read(buf, buffer_f32);
	energie = buffer_read(buf, buffer_f32);
	reload = buffer_read(buf, buffer_f32);
	throwreload = buffer_read(buf, buffer_f32);
	light = buffer_read(buf, buffer_f32);
	left = buffer_read(buf, buffer_s8);
	dir = buffer_read(buf, buffer_f32);
	
	movex = buffer_read(buf, buffer_f32);
	movey = buffer_read(buf, buffer_f32);
	move = buffer_read(buf, buffer_f32);
	
	viewspeed = buffer_read(buf, buffer_f32);
	myxspeed = buffer_read(buf, buffer_f32);
	myyspeed = buffer_read(buf, buffer_f32);
	myspeed = buffer_read(buf, buffer_f32);
	legdir = buffer_read(buf, buffer_f32);
	legindex = buffer_read(buf, buffer_f16);
	
	last_sprite = buffer_read(buf, buffer_u32);
	throwindex = buffer_read(buf, buffer_f32);
	masksprite = buffer_read(buf, buffer_u32);
	maskindex = buffer_read(buf, buffer_f16);
	maskon = buffer_read(buf, buffer_u8);
	
	release = buffer_read(buf, buffer_f32);
	shieldwait = buffer_read(buf, buffer_f32);
	clear = buffer_read(buf, buffer_f32);
	aim = buffer_read(buf, buffer_u8);
	aimfar = buffer_read(buf, buffer_u8);
	factor = buffer_read(buf, buffer_f16);
	
	persistent = buffer_read(buf, buffer_u8);
	
	global.enemy = buffer_read(buf, buffer_f32);
	
	viewdir = buffer_read(buf, buffer_f32);
	vdist = buffer_read(buf, buffer_f32);
	vdir = buffer_read(buf, buffer_f32);
}