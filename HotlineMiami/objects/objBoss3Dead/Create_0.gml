image_speed = 0.25;
wait = 40;
direction = 90;
objPlayer.visible = 0;
index = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write(buf, buffer_f32, wait);
	buffer_write(buf, buffer_f16, index);
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	wait = buffer_read(buf, buffer_f32);
	index = buffer_read(buf, buffer_f16);
}