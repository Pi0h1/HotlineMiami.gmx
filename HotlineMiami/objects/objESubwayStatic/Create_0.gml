image_speed = 0;
alert = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, alert );
}

DoLoad = function() {
	scrLoadGeneric(global.tempSave[room])
	alert = buffer_read(global.tempSave[room], buffer_f32 );
}