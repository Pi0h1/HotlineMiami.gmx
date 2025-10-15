image_speed = 0;
alert = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, alert );
}

DoLoad = function(buf) {
	scrLoadGeneric(global.tempSave[room]);
	alert = buffer_read(buf, buffer_f32 );
}