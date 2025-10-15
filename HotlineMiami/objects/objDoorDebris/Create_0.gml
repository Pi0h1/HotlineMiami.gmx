image_index = random(8);
image_speed = 0;
dir_add = -1 + round(random(2));
image_angle = random(360);
friction = 0.1;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f16, dir_add );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	dir_add = buffer_read(buf, buffer_f16 );
}