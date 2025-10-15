swingspeed = 0;
x += 5;
swinger = 0;

DoSave = function(buf) {
	buffer_write( buf, buffer_u32, sprite_index );
	buffer_write( buf, buffer_f32, image_angle );
	buffer_write( buf, buffer_f32, swingspeed );
	buffer_write( buf, buffer_f32, swinger );
	buffer_write( buf, buffer_u8, solid );
}
DoLoad = function(buf) {
	sprite_index = buffer_read(buf, buffer_u32 );
	image_angle = buffer_read(buf, buffer_f32 );
	swingspeed = buffer_read(buf, buffer_f32 );
	swinger = buffer_read(buf, buffer_f32 );
	solid = buffer_read(buf, buffer_u8 );
}