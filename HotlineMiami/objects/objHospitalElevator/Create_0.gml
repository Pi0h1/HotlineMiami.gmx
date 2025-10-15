wait = 80;
index = 0;
if (image_angle == 0) {
    addx = 0;
    addy = 0.5;
}
if (image_angle == 90) {
    addx = 0.5;
    addy = 0;
}
if (image_angle == 180) {
    addx = 0;
    addy = -0.5;
}
if (image_angle == 270) {
    addx = -0.5;
    addy = 0;
}
touch = 0;
wait2 = 15;
image_speed = 0;
saved = 0;
movex = 0;
movey = 0;
nextroom = -1;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, wait );
	buffer_write( buf, buffer_f32, wait2 );
	buffer_write( buf, buffer_f16, index );
	buffer_write( buf, buffer_f32, addx );
	buffer_write( buf, buffer_f32, addy );
	buffer_write( buf, buffer_f32, movex );
	buffer_write( buf, buffer_f32, movey );
	buffer_write( buf, buffer_u8, touch );
	buffer_write( buf, buffer_f16, nextroom );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	wait = buffer_read(buf, buffer_f32 );
	wait2 = buffer_read(buf, buffer_f32 );
	index = buffer_read(buf, buffer_f16 );
	addx = buffer_read(buf, buffer_f32 );
	addy = buffer_read(buf, buffer_f32 );
	movex = buffer_read(buf, buffer_f32 );
	movey = buffer_read(buf, buffer_f32 );
	touch = buffer_read(buf, buffer_u8 );
	nextroom = buffer_read(buf, buffer_f16 );
}