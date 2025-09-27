image_speed = 0;
friction = 0.1;
image_index = 1;
reload = 100 + random(120);

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, reload );
	
}

DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	reload = buffer_read(global.tempSave[room], buffer_f32 );
}