vspeed = 0;
image_speed = 0;
state = 0;
image_angle = 270;
direction = 270;
siren = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_u8, state );
	buffer_write( global.tempSave[room], buffer_u8, siren );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	state = buffer_read(global.tempSave[room], buffer_u8 );
	siren = buffer_read(global.tempSave[room], buffer_u8 );
}