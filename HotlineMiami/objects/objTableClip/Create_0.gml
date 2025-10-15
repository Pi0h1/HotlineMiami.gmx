image_speed = 0;
seen = 0;
dir = 90;
image_angle = random(360);

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_u8, seen );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	seen = buffer_read(buf, buffer_u8);
}