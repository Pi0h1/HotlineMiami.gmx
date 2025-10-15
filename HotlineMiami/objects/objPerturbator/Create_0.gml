image_speed = 0;
alarm[0] = 1 + random(1500);

DoSave = function(buf) {
	buffer_write(buf, buffer_f16, image_speed);
	buffer_write(buf, buffer_f32, alarm[0]);
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	image_speed = buffer_read(buf, buffer_f16);
	alarm[0] = buffer_read(buf, buffer_f32);
}