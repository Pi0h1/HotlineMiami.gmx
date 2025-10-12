image_speed = 0;
dir = random(360);
on = 0;
wait = 180;
talked = 0;
called = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, wait );
	buffer_write( global.tempSave[room], buffer_f32, dir );
	buffer_write( global.tempSave[room], buffer_f32, alarm[0] );
	buffer_write( global.tempSave[room], buffer_f32, alarm[1] );
	buffer_write( global.tempSave[room], buffer_u8, on );
	buffer_write( global.tempSave[room], buffer_u8, talked );
	buffer_write( global.tempSave[room], buffer_u8, called );

}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	wait = buffer_read(global.tempSave[room], buffer_f32 );
	dir = buffer_read(global.tempSave[room], buffer_f32 );
	alarm[0] = buffer_read(global.tempSave[room], buffer_f32 );
	alarm[1] = buffer_read(global.tempSave[room], buffer_f32 );
	on = buffer_read(global.tempSave[room], buffer_u8 );
	talked = buffer_read(global.tempSave[room], buffer_u8 );
	called = buffer_read(global.tempSave[room], buffer_u8 );
}