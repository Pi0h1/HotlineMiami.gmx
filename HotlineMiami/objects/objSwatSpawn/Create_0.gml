swats = 4;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_u8, swats );
	buffer_write( global.tempSave[room], buffer_f32, alarm[0] );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	swats = buffer_read(global.tempSave[room], buffer_u8 );
	alarm[0] = buffer_read(global.tempSave[room], buffer_f32 );
}