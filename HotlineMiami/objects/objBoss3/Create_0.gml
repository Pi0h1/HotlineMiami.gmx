image_speed = 0.06;
speed = 0.25;
alarm[0] = 80;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write(buf, buffer_f32, alarm[0]);
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	alarm[0] = buffer_read(buf, buffer_f32);
}