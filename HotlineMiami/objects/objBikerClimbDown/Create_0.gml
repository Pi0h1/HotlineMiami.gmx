image_speed = 0;
wait = 5;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, wait );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	wait = buffer_read(buf, buffer_f32 );
}