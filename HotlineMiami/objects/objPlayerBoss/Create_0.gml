image_speed = 0;
alert = 0;
state = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
lastsprite = sprite_index;
maskindex = 0;
global.maskindex = 0;
maskon = 1;
global.maskon = 1;
legindex = 0;
sxeasy_play(working_directory + "\\Release.mp3");
left = 1;
maskdir = 0;
dist = 0;
maddx = 0;
maddy = 0;
test = objPlayer.persistent;
objPlayer.persistent = 0;
//global.loaded = 1;
//checkpoint_save(working_directory + "\\tempsave.sav");
//global.loaded = 0;
objPlayer.persistent = test;


DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_u8, alert );
	buffer_write( global.tempSave[room], buffer_u8, state );
	buffer_write( global.tempSave[room], buffer_u8, test );
	buffer_write( global.tempSave[room], buffer_u8, maskon );
	buffer_write( global.tempSave[room], buffer_u8, global.maskon );
	buffer_write( global.tempSave[room], buffer_u32, lastsprite );
	buffer_write( global.tempSave[room], buffer_f16, legindex );
	buffer_write( global.tempSave[room], buffer_f16, maskindex );
	buffer_write( global.tempSave[room], buffer_f16, global.maskindex );
	buffer_write( global.tempSave[room], buffer_f16, left );
	buffer_write( global.tempSave[room], buffer_f32, maskdir );
	buffer_write( global.tempSave[room], buffer_f32, dist );
	buffer_write( global.tempSave[room], buffer_f16, maddx );
	buffer_write( global.tempSave[room], buffer_f16, maddy );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	alert = buffer_read(global.tempSave[room], buffer_u8 );
	state = buffer_read(global.tempSave[room], buffer_u8 );
	test = buffer_read(global.tempSave[room], buffer_u8 );
	maskon = buffer_read(global.tempSave[room], buffer_u8 );
	global.maskon = buffer_read(global.tempSave[room], buffer_u8 );
	lastsprite = buffer_read(global.tempSave[room], buffer_u32 );
	legindex = buffer_read(global.tempSave[room], buffer_f16 );
	maskindex = buffer_read(global.tempSave[room], buffer_f16 );
	global.maskindex = buffer_read(global.tempSave[room], buffer_f16 );
	left = buffer_read(global.tempSave[room], buffer_f16 );
	maskdir = buffer_read(global.tempSave[room], buffer_f32 );
	dist = buffer_read(global.tempSave[room], buffer_f32 );
	maddx = buffer_read(global.tempSave[room], buffer_f16 );
	maddy = buffer_read(global.tempSave[room], buffer_f16 );
}