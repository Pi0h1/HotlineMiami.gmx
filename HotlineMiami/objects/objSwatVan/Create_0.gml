image_speed = 0;
spawn = 0;
visible = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_u8, spawn );
	buffer_write( global.tempSave[room], buffer_u8, solid );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	spawn = buffer_read(global.tempSave[room], buffer_u8 );
	solid = buffer_read(global.tempSave[room], buffer_u8 );
}