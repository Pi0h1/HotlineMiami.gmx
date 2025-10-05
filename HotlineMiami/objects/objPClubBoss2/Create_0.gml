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

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, bled );
	buffer_write( global.tempSave[room], buffer_f32, ammo );
	buffer_write( global.tempSave[room], buffer_f16, hurtindex );
	buffer_write( global.tempSave[room], buffer_f16, targetindex );
	buffer_write( global.tempSave[room], buffer_f16, maskindex );
	buffer_write( global.tempSave[room], buffer_u8, maskon );

}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	bled = buffer_read(global.tempSave[room], buffer_f32 );
	ammo = buffer_read(global.tempSave[room], buffer_f32 );
	hurtindex = buffer_read(global.tempSave[room], buffer_f16 );
	targetindex = buffer_read(global.tempSave[room], buffer_f16 );
	maskindex = buffer_read(global.tempSave[room], buffer_f16 );
	maskon = buffer_read(global.tempSave[room], buffer_u8 );
}