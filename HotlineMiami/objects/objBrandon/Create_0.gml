image_speed = 0;
alarm[0] = 1 + random(900);

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write(buf, buffer_f32, alarm[0]);
	buffer_write(buf, buffer_f32, alarm[1]);
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	alarm[0] = buffer_read(buf, buffer_f32);
	alarm[1] = buffer_read(buf, buffer_f32);
}