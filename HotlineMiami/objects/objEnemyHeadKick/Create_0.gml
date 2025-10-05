image_index = 1;
image_speed = 0;
ammo = 0;
bled = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
dir = 0;
viewspeed = 0;
viewdir = 0;
vdist = 0;
vdir = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, dir );
	buffer_write( global.tempSave[room], buffer_f32, bled );
	buffer_write( global.tempSave[room], buffer_f32, ammo );
	buffer_write(global.tempSave[room], buffer_f32, viewspeed);
	buffer_write(global.tempSave[room], buffer_f32, viewdir);
	buffer_write(global.tempSave[room], buffer_f32, vdist);
	buffer_write(global.tempSave[room], buffer_f32, vdir);

}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	dir = buffer_read(global.tempSave[room], buffer_f32 );
	bled = buffer_read(global.tempSave[room], buffer_f32 );
	ammo = buffer_read(global.tempSave[room], buffer_f32 );
	viewspeed = buffer_read(global.tempSave[room], buffer_f32);
	viewdir = buffer_read(global.tempSave[room], buffer_f32);
	vdist = buffer_read(global.tempSave[room], buffer_f32);
	vdir = buffer_read(global.tempSave[room], buffer_f32);
}