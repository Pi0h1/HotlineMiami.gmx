ylimit = 0;
DoSave = function(buf) {
	buffer_write(buf, buffer_u8, solid);
	buffer_write(buf, buffer_f32, ylimit);
}
DoLoad = function(buf) {
	solid = buffer_read(buf, buffer_u8);
	ylimit = buffer_read(buf, buffer_f32);
}