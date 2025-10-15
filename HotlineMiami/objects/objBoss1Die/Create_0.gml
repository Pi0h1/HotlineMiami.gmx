image_speed = 0;
bled = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_u8, bled );


}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	bled = buffer_read(buf, buffer_u8 );
}