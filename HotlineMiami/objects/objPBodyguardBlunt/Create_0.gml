hurtindex = 0;
targetindex = 0;
image_speed = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
ammo = 0;
bottom = sprBodyguardBlunt;
global.maskon = 1;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, ammo );
	buffer_write( buf, buffer_f16, hurtindex );
	buffer_write( buf, buffer_f16, targetindex );
	buffer_write( buf, buffer_u32, bottom );

}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	ammo = buffer_read(buf, buffer_f32 );
	hurtindex = buffer_read(buf, buffer_f16 );
	targetindex = buffer_read(buf, buffer_f16 );
	bottom = buffer_read(buf, buffer_u32 );
}