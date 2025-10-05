hurtindex = 0;
targetindex = 0;
image_speed = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
ammo = 0;
bottom = sprEBluntKill;
if (global.xbox)
    scrInitXboxButtons();

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, dir );
	buffer_write( global.tempSave[room], buffer_f32, bled );
	buffer_write( global.tempSave[room], buffer_f32, ammo );
	buffer_write( global.tempSave[room], buffer_f16, hurtindex );
	buffer_write( global.tempSave[room], buffer_f16, targetindex );
	buffer_write( global.tempSave[room], buffer_u32, bottom );

}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	dir = buffer_read(global.tempSave[room], buffer_f32 );
	bled = buffer_read(global.tempSave[room], buffer_f32 );
	ammo = buffer_read(global.tempSave[room], buffer_f32 );
	hurtindex = buffer_read(global.tempSave[room], buffer_f16 );
	targetindex = buffer_read(global.tempSave[room], buffer_f16 );
	bottom = buffer_read(global.tempSave[room], buffer_u32 );
}