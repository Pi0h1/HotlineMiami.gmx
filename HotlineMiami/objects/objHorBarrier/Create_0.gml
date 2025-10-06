ylimit = 0;
DoSave = function() {
	buffer_write(global.tempSave[room], buffer_u8, solid);
	buffer_write(global.tempSave[room], buffer_f32, ylimit);
}
DoLoad = function() {
	solid = buffer_read(global.tempSave[room], buffer_u8);
	ylimit = buffer_read(global.tempSave[room], buffer_f32);
}