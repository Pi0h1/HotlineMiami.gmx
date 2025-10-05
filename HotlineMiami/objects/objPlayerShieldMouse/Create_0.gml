image_speed = 0;
dir = 0;
if (global.xbox)
    scrInitXboxButtons();
myxspeed = 0;
myyspeed = 0;
move = 0;
movex = 0;
movey = 0;

viewspeed = 0;
bullets = 0;
reload = 0;
light = 0;
legdir = 0;
legindex = 0;
legindex2 = 0;
left = 1;
ammo = 0;
energie = 10;
throwreload = 0;
scrInitThrowPos();
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
last_sprite = sprite_index;
throwindex = 0;
maskindex = global.maskindex;
maskon = global.maskon;
masksprite = -1;
reset = mouse_check_button(mb_right);
shotgunned = 0;
aim = 0;
SteamSetAchievement("ACH_NIGEL_LOWRIE");
snap = 0;
xview = 0;
yview = 0;
addx = 0;
addy = 0;

DoSave = function() {
	
	// xbox vars
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
	buffer_write(global.tempSave[room], buffer_f16, myxspeed);
	buffer_write(global.tempSave[room], buffer_f16, myyspeed);
	buffer_write(global.tempSave[room], buffer_f16, move);
	buffer_write(global.tempSave[room], buffer_f16, movex);
	buffer_write(global.tempSave[room], buffer_f16, movey);
	buffer_write(global.tempSave[room], buffer_f32, viewspeed);
	buffer_write(global.tempSave[room], buffer_f16, bullets);
	buffer_write(global.tempSave[room], buffer_f16, reload);
	buffer_write(global.tempSave[room], buffer_f16, light);
	buffer_write(global.tempSave[room], buffer_f32, legdir);
	buffer_write(global.tempSave[room], buffer_f16, legindex);
	buffer_write(global.tempSave[room], buffer_f16, legindex2);
	buffer_write(global.tempSave[room], buffer_f16, left);
	buffer_write(global.tempSave[room], buffer_f32, ammo);
	buffer_write(global.tempSave[room], buffer_f32, energie);
	buffer_write(global.tempSave[room], buffer_f32, throwreload);
	buffer_write(global.tempSave[room], buffer_u32, last_sprite);
	buffer_write(global.tempSave[room], buffer_f16, throwindex);
	buffer_write(global.tempSave[room], buffer_f16, maskindex);
	buffer_write(global.tempSave[room], buffer_f16, maskon);
	buffer_write(global.tempSave[room], buffer_u32, masksprite);
	buffer_write(global.tempSave[room], buffer_f16, reset);
	buffer_write(global.tempSave[room], buffer_f16, shotgunned);
	buffer_write(global.tempSave[room], buffer_f16, aim);
	buffer_write(global.tempSave[room], buffer_f16, snap);
	buffer_write(global.tempSave[room], buffer_f32, xview);
	buffer_write(global.tempSave[room], buffer_f32, yview);
	buffer_write(global.tempSave[room], buffer_f32, addx);
	buffer_write(global.tempSave[room], buffer_f32, addy);
}
DoLoad = function () {
	myxspeed = buffer_read(global.tempSave[room], buffer_f16);
	myyspeed = buffer_read(global.tempSave[room], buffer_f16);
	move = buffer_read(global.tempSave[room], buffer_f16);
	movex = buffer_read(global.tempSave[room], buffer_f16);
	movey = buffer_read(global.tempSave[room], buffer_f16);
	viewspeed = buffer_read(global.tempSave[room], buffer_f32);
	bullets = buffer_read(global.tempSave[room], buffer_f16);
	reload = buffer_read(global.tempSave[room], buffer_f16);
	light = buffer_read(global.tempSave[room], buffer_f16);
	legdir = buffer_read(global.tempSave[room], buffer_f32);
	legindex = buffer_read(global.tempSave[room], buffer_f16);
	legindex2 = buffer_read(global.tempSave[room], buffer_f16);
	left = buffer_read(global.tempSave[room], buffer_f16);
	ammo = buffer_read(global.tempSave[room], buffer_f32);
	energie = buffer_read(global.tempSave[room], buffer_f32);
	throwreload = buffer_read(global.tempSave[room], buffer_f32);
	last_sprite = buffer_read(global.tempSave[room], buffer_u32);
	throwindex = buffer_read(global.tempSave[room], buffer_f16);
	maskindex = buffer_read(global.tempSave[room], buffer_f16);
	maskon = buffer_read(global.tempSave[room], buffer_f16);
	masksprite = buffer_read(global.tempSave[room], buffer_u32);
	reset = buffer_read(global.tempSave[room], buffer_f16);
	shotgunned = buffer_read(global.tempSave[room], buffer_f16);
	aim = buffer_read(global.tempSave[room], buffer_f16);
	snap = buffer_read(global.tempSave[room], buffer_f16);
	xview = buffer_read(global.tempSave[room], buffer_f32);
	yview = buffer_read(global.tempSave[room], buffer_f32);
	addx = buffer_read(global.tempSave[room], buffer_f32);
	addy = buffer_read(global.tempSave[room], buffer_f32);
}