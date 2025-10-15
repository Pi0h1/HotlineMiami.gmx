image_speed = 0;
spawned = 0;
global.test = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write(buf, buffer_f32, spawned);
	buffer_write(buf, buffer_f16, image_speed);
	buffer_write(buf, buffer_u8, global.test);
	buffer_write(buf, buffer_f32, alarm[0]);
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	spawned = buffer_read(buf, buffer_f32);
	image_speed = buffer_read(buf, buffer_f16);
	global.test = buffer_read(buf, buffer_u8);
	alarm[0] = buffer_read(buf, buffer_f32);
}