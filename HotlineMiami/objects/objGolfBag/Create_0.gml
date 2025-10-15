image_angle = random(360);
image_speed = 0;
dir = 90;
if (global.xbox)
    scrInitXboxButtons();

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, dir );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	dir = buffer_read(buf, buffer_f32 );
}