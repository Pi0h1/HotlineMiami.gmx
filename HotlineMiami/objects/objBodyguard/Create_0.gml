image_speed = 0;
wait = 40;
state = 0;
legindex = 0;
path = path_add();
pwait = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_u16, state );
	buffer_write( global.tempSave[room], buffer_f32, wait );
	buffer_write( global.tempSave[room], buffer_f32, pwait );
	buffer_write( global.tempSave[room], buffer_f16, legindex );

}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	state = buffer_read(global.tempSave[room], buffer_u16 );
	wait = buffer_read(global.tempSave[room], buffer_f32 );
	pwait = buffer_read(global.tempSave[room], buffer_f32 );
	legindex = buffer_read(global.tempSave[room], buffer_f16 );
}