dir = 0;
taken = 0;
if (global.masks[24] == 1)
    taken = 1;
image_speed = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write(buf, buffer_u8, taken);
	buffer_write(buf, buffer_f32, dir);
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	taken = buffer_read(buf, buffer_u8);
	dir = buffer_read(buf, buffer_f32);
}