image_speed = 0;
dir = random(360);
called = 0;
wait = 160;
answered = 0;


DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, dir );
	buffer_write( buf, buffer_u8, called );
	buffer_write( buf, buffer_f32, wait );
	buffer_write( buf, buffer_u8, answered );
	buffer_write( buf, buffer_f32, alarm[0] );
	buffer_write( buf, buffer_f32, alarm[1] );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	dir = buffer_read(buf, buffer_f32 );
	called = buffer_read(buf, buffer_u8 ); 
	wait = buffer_read(buf, buffer_f32 );
	answered = buffer_read(buf, buffer_u8 );
	alarm[0] = buffer_read(buf, buffer_f32 );
	alarm[1] = buffer_read(buf, buffer_f32 );
}