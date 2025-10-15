dist = 6 + random(22);
image_speed = 0.1 + random(0.1);
image_index = random(100);
wait = 60 + random(40);

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, dist );
	buffer_write( buf, buffer_f32, wait );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	dist = buffer_read(buf, buffer_f32 );
	wait = buffer_read(buf, buffer_f32 );
}