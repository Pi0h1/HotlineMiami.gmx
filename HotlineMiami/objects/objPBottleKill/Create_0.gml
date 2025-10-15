image_speed = 0;
bled = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
ammo = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, bled );
	buffer_write( buf, buffer_f32, ammo );

}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	bled = buffer_read(buf, buffer_f32 );
	ammo = buffer_read(buf, buffer_f32 );
}