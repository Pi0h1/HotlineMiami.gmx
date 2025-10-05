on = 1;
image_speed = 0.15;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_u8, on );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	on = buffer_read(global.tempSave[room], buffer_u8 );
}