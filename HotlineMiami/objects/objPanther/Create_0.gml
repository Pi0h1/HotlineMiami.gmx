if (round(random(10)) == 1)
    image_speed = 0.125;
else image_speed = 0;
alarm[0] = 30 + random(100);
state = 0;

wait = 120;
energie = 1;
hit = 0;

path = path_add();

pwait = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_u16, state );
	buffer_write( global.tempSave[room], buffer_f32, wait );
	buffer_write( global.tempSave[room], buffer_f32, pwait );
	buffer_write( global.tempSave[room], buffer_f32, energie );
	buffer_write( global.tempSave[room], buffer_u8, hit );
	buffer_write( global.tempSave[room], buffer_f32, alarm[0] );

}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	state = buffer_read(global.tempSave[room], buffer_u16 );
	wait = buffer_read(global.tempSave[room], buffer_f32 );
	pwait = buffer_read(global.tempSave[room], buffer_f32 );
	energie = buffer_read(global.tempSave[room], buffer_f32 );
	hit = buffer_read(global.tempSave[room], buffer_u8 );
	alarm[0] = buffer_read(global.tempSave[room], buffer_f32 );
}