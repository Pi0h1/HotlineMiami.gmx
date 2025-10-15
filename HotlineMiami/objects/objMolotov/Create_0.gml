image_angle = random(360);
image_speed = 0.25;
friction = 0.1;
dist = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write(buf, buffer_f32, dist);
}
DoLoad = function () {
	scrLoadGeneric(buf);
	dist = buffer_read(buf, buffer_f32);
}