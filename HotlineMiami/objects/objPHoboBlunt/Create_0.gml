hurtindex = 0;
targetindex = 0;
image_speed = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprPBashBoss2);
ammo = 0;
maskindex = global.maskindex;
if (global.xbox)
    scrInitXboxButtons();

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, hurtindex );
	buffer_write( buf, buffer_f32, targetindex );
	buffer_write( buf, buffer_f32, maskindex );
	buffer_write( buf, buffer_f32, ammo );

}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	hurtindex = buffer_read(buf, buffer_f16 );
	targetindex = buffer_read(buf, buffer_f16 );
	maskindex = buffer_read(buf, buffer_f16 );
	ammo = buffer_read(buf, buffer_f32 );
}