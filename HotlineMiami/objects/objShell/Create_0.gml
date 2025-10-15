friction = 0.1;
rotspeed = (-1 + round(random(1)) * 2) * random(5);
startspeed = 0.1;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, rotspeed );
	buffer_write( buf, buffer_f32, startspeed );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	rotspeed = buffer_read(buf, buffer_f32 );
	startspeed = buffer_read(buf, buffer_f32 );
}