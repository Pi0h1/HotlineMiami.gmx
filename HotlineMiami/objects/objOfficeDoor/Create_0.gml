image_speed = 0;
friction = 0.15;
broke = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write(buf, buffer_u8, broke);
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	broke = buffer_read(buf, buffer_u8);
}