dir = 0;
start_y = y;
ldir = 0;
stop = 0;
on = 0;

DoSave = function(buf) {
	buffer_write( buf, buffer_f32, start_y );
	buffer_write( buf, buffer_f32, dir );
	buffer_write( buf, buffer_f32, ldir );
	buffer_write( buf, buffer_u8, on );
	buffer_write( buf, buffer_u8, stop );
}
DoLoad = function(buf) {
	start_y = buffer_read(buf, buffer_f32 );
	dir = buffer_read(buf, buffer_f32 );
	ldir = buffer_read(buf, buffer_f32 );
	on = buffer_read(buf, buffer_u8 );
	stop = buffer_read(buf, buffer_u8 );
}