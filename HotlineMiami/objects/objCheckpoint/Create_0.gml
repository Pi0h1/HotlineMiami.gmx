text = "STAGE CLEAR";
dir = 0;
dir2 = 0;
factor = 0;
start_x = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);	
	buffer_write(global.tempSave[room], buffer_f32, dir);
	buffer_write(global.tempSave[room], buffer_f32, dir2);
	buffer_write(global.tempSave[room], buffer_string, text);
	buffer_write(global.tempSave[room], buffer_f32, factor);
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);	
	dir = buffer_read(global.tempSave[room], buffer_f32);
	dir2 = buffer_read(global.tempSave[room], buffer_f32);
	text = buffer_read(global.tempSave[room], buffer_string);
	factor = buffer_read(global.tempSave[room], buffer_f32);
}