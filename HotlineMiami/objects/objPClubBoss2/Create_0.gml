image_speed = 0;
bled = 0;
hurtindex = 0;
targetindex = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
ammo = 0;
global.maskon = 1;
maskon = 1;
maskindex = global.maskindex;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, bled );
	buffer_write( buf, buffer_f32, ammo );
	buffer_write( buf, buffer_f16, hurtindex );
	buffer_write( buf, buffer_f16, targetindex );
	buffer_write( buf, buffer_f16, maskindex );
	buffer_write( buf, buffer_u8, maskon );

}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	bled = buffer_read(buf, buffer_f32 );
	ammo = buffer_read(buf, buffer_f32 );
	hurtindex = buffer_read(buf, buffer_f16 );
	targetindex = buffer_read(buf, buffer_f16 );
	maskindex = buffer_read(buf, buffer_f16 );
	maskon = buffer_read(buf, buffer_u8 );
}