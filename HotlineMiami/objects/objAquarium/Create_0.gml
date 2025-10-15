image_speed = 0.2;
start_x = 0;
start_y = 0;
addx = 0;
addy = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, start_x );
	buffer_write( buf, buffer_f32, start_y );
	buffer_write( buf, buffer_f32, addx );
	buffer_write( buf, buffer_f32, addy );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	start_x = buffer_read(buf, buffer_f32 );
	start_y = buffer_read(buf, buffer_f32 );
	addx = buffer_read(buf, buffer_f32 );
	addy = buffer_read(buf, buffer_f32 );
}