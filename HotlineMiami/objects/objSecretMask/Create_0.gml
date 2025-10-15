image_angle = random(360);
image_speed = 0;
dir = 0;

DoSave = function(buf) {
	buffer_write(buf, buffer_f16, image_index);
	buffer_write(buf, buffer_f16, image_angle);
	buffer_write(buf, buffer_f32, dir);
}
DoLoad = function(buf) {
	image_index = buffer_read(buf, buffer_f16);
	image_angle = buffer_read(buf, buffer_f16);
	dir = buffer_read(buf, buffer_f32);
}