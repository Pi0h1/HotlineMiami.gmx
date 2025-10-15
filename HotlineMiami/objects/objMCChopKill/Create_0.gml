hurtindex = 0;
targetindex = 0;
image_speed = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
ammo = 0;
bottom = sprEChopKill;
if (global.xbox)
    scrInitXboxButtons();

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_u32, bottom );
	buffer_write( buf, buffer_f32, ammo );
	buffer_write( buf, buffer_f16, hurtindex );
	buffer_write( buf, buffer_f16, targetindex );

}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	bottom = buffer_read(buf, buffer_u32 );
	ammo = buffer_read(buf, buffer_f32 );
	hurtindex = buffer_read(buf, buffer_f16 );
	targetindex = buffer_read(buf, buffer_f16 );
}