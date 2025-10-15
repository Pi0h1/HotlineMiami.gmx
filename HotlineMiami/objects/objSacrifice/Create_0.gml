image_speed = 0;
state = 0;
wait = 0;
xview = 0;
yview = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write(buf, buffer_u8, state);
	buffer_write(buf, buffer_f32, wait);
	buffer_write(buf, buffer_f32, xview);
	buffer_write(buf, buffer_f32, yview);
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	state = buffer_read(buf, buffer_u8);
	wait = buffer_read(buf, buffer_f32);
	xview = buffer_read(buf, buffer_f32);
	yview = buffer_read(buf, buffer_f32);
}