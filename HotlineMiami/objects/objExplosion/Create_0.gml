image_speed = 0;
index = 2;
dir = random(1000);
amount = 0;
camera_set_view_angle(view_camera[0], 2);
on = 0;
wait = 300;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f16, index );
	buffer_write( buf, buffer_f32, dir );
	buffer_write( buf, buffer_f16, amount );
	buffer_write( buf, buffer_f32, wait );
	buffer_write( buf, buffer_u8, on );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	index = buffer_read(buf, buffer_f16 );
	dir = buffer_read(buf, buffer_f32 );
	amount = buffer_read(buf, buffer_f16 );
	wait = buffer_read(buf, buffer_f32 );
	on = buffer_read(buf, buffer_u8 );
}