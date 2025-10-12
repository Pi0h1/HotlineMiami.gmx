image_speed = 0.35;
dir = 0;
active = 1;
state = 0;
if (global.xbox)
    scrInitXboxButtons();

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_u8, state );
	buffer_write( global.tempSave[room], buffer_u8, active );
	buffer_write( global.tempSave[room], buffer_f32, dir );
	buffer_write( global.tempSave[room], buffer_f32, alarm[0] );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	state = buffer_read(global.tempSave[room], buffer_u8 );
	active = buffer_read(global.tempSave[room], buffer_u8 );
	dir = buffer_read(global.tempSave[room], buffer_f32 );
	alarm[0] = buffer_read(global.tempSave[room], buffer_f32 );
}