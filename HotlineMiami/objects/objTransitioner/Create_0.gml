dir = 0;
sprite = sprGoArrow;
addx = 0;
addy = 0;
movex = 0;
movey = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_u32, sprite );
	buffer_write( buf, buffer_f32, addx );
	buffer_write( buf, buffer_f32, addy );
	buffer_write( buf, buffer_f32, movex );
	buffer_write( buf, buffer_f32, movey );
	buffer_write( buf, buffer_f32, dir );
	buffer_write( buf, buffer_u32, nextroom );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	sprite = buffer_read(buf, buffer_u32 );
	addx = buffer_read(buf, buffer_f32 );
	addy = buffer_read(buf, buffer_f32 );
	movex = buffer_read(buf, buffer_f32 );
	movey = buffer_read(buf, buffer_f32 );
	dir = buffer_read(buf, buffer_f32 );
	nextroom = buffer_read(buf, buffer_u32 );
}