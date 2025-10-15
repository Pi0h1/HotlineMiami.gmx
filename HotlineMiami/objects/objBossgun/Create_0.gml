image_angle = random(360);
image_speed = 0;
dir = random(360);
angle_speed = -1 + round(random(1)) * 2;
if (global.xbox)
    scrInitXboxButtons();

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, dir );
	buffer_write( buf, buffer_f32, angle_speed );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	dir = buffer_read(buf, buffer_f32 );
	angle_speed = buffer_read(buf, buffer_f32 );
}