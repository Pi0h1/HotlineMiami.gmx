image_speed = 0;
friction = 0.1;
wait = 60;
dead = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, wait );
	buffer_write( buf, buffer_u8, dead );


}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	wait = buffer_read(buf, buffer_f32 );
	dead = buffer_read(buf, buffer_u8 );
}