dir_add = -1 + round(random(1)) * 2;
friction = 0.2;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, dir_add );
}

DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	dir_Add = buffer_read(global.tempSave[room], buffer_f32 );
}