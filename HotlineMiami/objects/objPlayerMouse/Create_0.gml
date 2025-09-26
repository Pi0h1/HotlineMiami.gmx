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
DoSave = function() {
	buffer_write(global.tempSave[room], buffer_u32, sprite_index);
	buffer_write(global.tempSave[room], buffer_u32, image_index);
	buffer_write(global.tempSave[room], buffer_f32, image_speed);
	
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
	
	buffer_write(global.tempSave[room], buffer_f32, release);
	buffer_write(global.tempSave[room], buffer_f32, shieldwait);
	buffer_write(global.tempSave[room], buffer_f32, clear);
}
// Everything must be loaded in the same order you save them, as well as the same read type!
DoLoad = function() {
	sprite_index = buffer_read(global.tempSave[room], buffer_u32);	
	image_index = buffer_read(global.tempSave[room], buffer_u32);
	image_speed = buffer_read(global.tempSave[room], buffer_f32);
	
	// involves mask.nfo
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
	
	release = buffer_read(global.tempSave[room], buffer_f32);
	shieldwait = buffer_read(global.tempSave[room], buffer_f32);
	clear = buffer_read(global.tempSave[room], buffer_f32);
}