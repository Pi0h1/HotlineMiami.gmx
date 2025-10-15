active = 0;
state = 0;
wait = 180;
dir = 0;
pickup = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_u8, active );
	buffer_write( buf, buffer_u8, state );
	buffer_write( buf, buffer_f32, wait );
	buffer_write( buf, buffer_f32, dir );
	buffer_write( buf, buffer_u8, pickup );
	buffer_write( buf, buffer_u8, solid );


}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	active = buffer_read(buf, buffer_u8 );
	state = buffer_read(buf, buffer_u8 );
	wait = buffer_read(buf, buffer_f32 );
	dir = buffer_read(buf, buffer_f32 );
	pickup = buffer_read(buf, buffer_u8 );
	solid = buffer_read(buf, buffer_u8 );
}