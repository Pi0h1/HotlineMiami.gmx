angle = random(360);
image_speed = 0;
bounced = 0;
dir_add = -1 + round(random(1)) * 2;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write(buf, buffer_f32, angle);
	buffer_write(buf, buffer_u8, bounced);
	buffer_write(buf, buffer_f32, dir_add);
}
DoLoad = function () {
	scrLoadGeneric(buf);
	angle = buffer_read(buf, buffer_f32);
	bounced = buffer_read(buf, buffer_u8);
	dir_add = buffer_read(buf, buffer_f32);
}