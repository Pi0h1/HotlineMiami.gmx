letter = 0;
dir = 0;

DoSave = function() {
	buffer_write(global.tempSave[room], buffer_f16, letter);
	buffer_write(global.tempSave[room], buffer_f32, dir);
}
DoLoad = function() {
	letter = buffer_read(global.tempSave[room], buffer_f16);
	dir = buffer_read(global.tempSave[room], buffer_f32);
}