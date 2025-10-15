image_speed = 0.15;
image_index = 1;
energie = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, wait );
	buffer_write( buf, buffer_f32, energie );


}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	wait = buffer_read(buf, buffer_f32 );
	energie = buffer_read(buf, buffer_f32 );
}