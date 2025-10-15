image_blend = c_aqua;
image_speed = 0;
image_index = floor(random(5)) * 2;
dist = 70 + random(27);

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, dist );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	dist = buffer_read(buf, buffer_f32 );
}