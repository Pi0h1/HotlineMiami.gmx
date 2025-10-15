image_speed = 0;
dir = random(360);
on = 0;
wait = 180;
talked = 0;
called = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, wait );
	buffer_write( buf, buffer_f32, dir );
	buffer_write( buf, buffer_f32, alarm[0] );
	buffer_write( buf, buffer_f32, alarm[1] );
	buffer_write( buf, buffer_u8, on );
	buffer_write( buf, buffer_u8, talked );
	buffer_write( buf, buffer_u8, called );

}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	wait = buffer_read(buf, buffer_f32 );
	dir = buffer_read(buf, buffer_f32 );
	alarm[0] = buffer_read(buf, buffer_f32 );
	alarm[1] = buffer_read(buf, buffer_f32 );
	on = buffer_read(buf, buffer_u8 );
	talked = buffer_read(buf, buffer_u8 );
	called = buffer_read(buf, buffer_u8 );
}