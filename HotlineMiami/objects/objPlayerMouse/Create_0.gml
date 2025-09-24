if (global.xbox) {
    scrInitXboxButtons();
}

if (room == rmTutorial) {
    global.maskindex = 3;
    global.maskon = 1;
    global.done = 1;
}

global.pigkill = 0;
image_speed = 0;
currentweapon = 0;
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

global.enemy = -1234;

if (!variable_local_exists("clear")) 
    clear = 0;
    
if (!place_free(x,y)) {
    x = global.executionx;
    y = global.executiony;
}

// See scrSaveGame() and scrLoadGame() for details regarding restarting a floor.
DoSave = function() {
	buffer_write(global.tempSave, buffer_u32, sprite_index);
	buffer_write(global.tempSave, buffer_u32, image_index);
	buffer_write(global.tempSave, buffer_f32, ammo);
	buffer_write(global.tempSave, buffer_f32, energie);
}
// Everything must be loaded in the same order you save them, as well as the same read type!
DoLoad = function() {
	sprite_index = buffer_read(global.tempSave, buffer_u32);	
	image_index = buffer_read(global.tempSave, buffer_u32);
	ammo = buffer_read(global.tempSave, buffer_f32);
	energie = buffer_read(global.tempSave, buffer_f32);
}