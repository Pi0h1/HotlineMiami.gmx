if (global.xbox)
    scrInitXboxButtons();
energie = 1 + floor(random(4));
if (global.maskindex == 2)
    energie = 0;
image_index = 3;
image_speed = 0;
dir = 0;
ammo = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
viewspeed = 0;
viewdir = 0;
vdist = 0;
vdir = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, energie );
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
	energie = buffer_read(global.tempSave[room], buffer_f32 );
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