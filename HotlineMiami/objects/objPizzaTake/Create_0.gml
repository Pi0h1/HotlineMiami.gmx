image_angle = random(360);
image_speed = 0;
dir = 45;
angle_speed = -1 + round(random(1)) * 2;
on = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_u8, on );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	on = buffer_read(buf, buffer_u8);
}