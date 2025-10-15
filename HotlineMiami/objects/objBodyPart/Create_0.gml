image_speed = 0;
friction = 0.1;
image_yscale = -1 + round(random(1)) * 2;
bled = 0;
//wait = random(100);
rotspeed = -1 + round(random(1)) * 2;
wait = 100;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, bled );
	buffer_write( buf, buffer_f32, wait );
	buffer_write( buf, buffer_f32, rotspeed );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	bled = buffer_read(buf, buffer_f32 );
	wait = buffer_read(buf, buffer_f32 );
	rotspeed = buffer_read(buf, buffer_f32 );
}