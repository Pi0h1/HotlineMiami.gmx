image_speed = 0;
friction = 0.1;
image_index = 1;
reload = 100 + random(120);

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, reload );
	
}

DoLoad = function(buf) {
	scrLoadGeneric(buf);
	reload = buffer_read(buf, buffer_f32 );
}