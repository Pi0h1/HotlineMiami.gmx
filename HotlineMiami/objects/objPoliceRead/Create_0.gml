image_speed = 0;
alarm[0] = 100;
on = 0;
test = 0;
global.doctor = -1234;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write(buf, buffer_f32, alarm[0]);
	buffer_write(buf, buffer_u8, on);
	buffer_write(buf, buffer_u8, test);
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	alarm[0] = buffer_read(buf, buffer_f32);
	on = buffer_read(buf, buffer_u8);
	test = buffer_read(buf, buffer_u8);
}