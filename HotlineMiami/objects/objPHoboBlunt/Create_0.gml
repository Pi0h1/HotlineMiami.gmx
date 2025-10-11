hurtindex = 0;
targetindex = 0;
image_speed = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprPBashBoss2);
ammo = 0;
maskindex = global.maskindex;
if (global.xbox)
    scrInitXboxButtons();

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, hurtindex );
	buffer_write( global.tempSave[room], buffer_f32, targetindex );
	buffer_write( global.tempSave[room], buffer_f32, maskindex );
	buffer_write( global.tempSave[room], buffer_f32, ammo );

}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	hurtindex = buffer_read(global.tempSave[room], buffer_f16 );
	targetindex = buffer_read(global.tempSave[room], buffer_f16 );
	maskindex = buffer_read(global.tempSave[room], buffer_f16 );
	ammo = buffer_read(global.tempSave[room], buffer_f32 );
}