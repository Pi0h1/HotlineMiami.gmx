image_speed = 0;
index = 2;
dir = random(1000);
amount = 0;
camera_set_view_angle(view_camera[0], 2);
on = 0;
wait = 300;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f16, index );
	buffer_write( global.tempSave[room], buffer_f32, dir );
	buffer_write( global.tempSave[room], buffer_f16, amount );
	buffer_write( global.tempSave[room], buffer_f32, wait );
	buffer_write( global.tempSave[room], buffer_u8, on );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	index = buffer_read(global.tempSave[room], buffer_f16 );
	dir = buffer_read(global.tempSave[room], buffer_f32 );
	amount = buffer_read(global.tempSave[room], buffer_f16 );
	wait = buffer_read(global.tempSave[room], buffer_f32 );
	on = buffer_read(global.tempSave[room], buffer_u8 );
}