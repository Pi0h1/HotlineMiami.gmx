image_speed = 0;
bled = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_u8, bled );


}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	bled = buffer_read(global.tempSave[room], buffer_u8 );
}