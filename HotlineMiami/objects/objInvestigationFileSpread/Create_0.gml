image_speed = 0;
seen = 0;
dir = 90;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_u8, seen );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	seen = buffer_read(global.tempSave[room], buffer_u8);
}