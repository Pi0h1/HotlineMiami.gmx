image_speed = 0;
spawned = 0;
wait = 100;
wait2 = 100;
on = 0;
global.opensound = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write(buf, buffer_u8, spawned);
	buffer_write(buf, buffer_f32, wait);
	buffer_write(buf, buffer_f32, wait2);
	buffer_write(buf, buffer_u8, on);
	buffer_write(buf, buffer_u8, global.opensound);
	buffer_write(buf, buffer_u8, solid);
	buffer_write(buf, buffer_f32, alarm[0]);
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	spawned = buffer_read(buf, buffer_u8);
	wait = buffer_read(buf, buffer_f32);
	wait2 = buffer_read(buf, buffer_f32);
	on = buffer_read(buf, buffer_u8);
	global.opensound = buffer_read(buf, buffer_u8);
	solid = buffer_read(buf, buffer_u8);
	alarm[0] = buffer_read(buf, buffer_f32);
}