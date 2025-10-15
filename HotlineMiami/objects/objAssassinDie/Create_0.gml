image_speed = 0;
bled = 0;
shot = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write(buf, buffer_u8, bled);
	buffer_write(buf, buffer_u8, shot);
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	bled = buffer_read(buf, buffer_u8);
	shot = buffer_read(buf, buffer_u8);
}
