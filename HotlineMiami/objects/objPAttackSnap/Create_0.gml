image_index = 1;
image_speed = 0;
ammo = 0;
bled = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
bag = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, bag );
	buffer_write( global.tempSave[room], buffer_f32, dir );
	buffer_write( global.tempSave[room], buffer_f32, bled );
	buffer_write( global.tempSave[room], buffer_f32, ammo );
	buffer_write( global.tempSave[room], buffer_f16, hurtindex );
	buffer_write( global.tempSave[room], buffer_f16, targetindex );
	buffer_write(global.tempSave[room], buffer_f32, viewspeed);
	buffer_write(global.tempSave[room], buffer_f32, viewdir);
	buffer_write(global.tempSave[room], buffer_f32, vdist);
	buffer_write(global.tempSave[room], buffer_f32, vdir);

}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	bag = buffer_read(global.tempSave[room], buffer_f32 );
	dir = buffer_read(global.tempSave[room], buffer_f32 );
	bled = buffer_read(global.tempSave[room], buffer_f32 );
	ammo = buffer_read(global.tempSave[room], buffer_f32 );
	hurtindex = buffer_read(global.tempSave[room], buffer_f16 );
	targetindex = buffer_read(global.tempSave[room], buffer_f16 );
	viewspeed = buffer_read(global.tempSave[room], buffer_f32);
	viewdir = buffer_read(global.tempSave[room], buffer_f32);
	vdist = buffer_read(global.tempSave[room], buffer_f32);
	vdir = buffer_read(global.tempSave[room], buffer_f32);
}