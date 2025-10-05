dir = random(360);
ammoy = -32;

DoSave = function() {
	buffer_write(global.tempSave[room], buffer_f32, dir);
	buffer_write(global.tempSave[room], buffer_f32, ammoy);
}
DoLoad = function() {
	dir = buffer_read(global.tempSave[room], buffer_f32);
	ammoy = buffer_read(global.tempSave[room], buffer_f32);
}