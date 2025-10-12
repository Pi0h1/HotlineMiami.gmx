image_speed = 0;
image_index = 0;
angle = random(360);
direction = angle;
speed = round(random(1));
image_speed = speed * 0.1;
alarm[0] = 60 + random(60);
energie = round(random(1));
checkreload = floor(random(8));
alert = 0;
light = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_u8, alert );
	buffer_write( global.tempSave[room], buffer_f32, energie );
	buffer_write( global.tempSave[room], buffer_f32, angle );
	buffer_write( global.tempSave[room], buffer_f32, checkreload );
	buffer_write( global.tempSave[room], buffer_f32, light );
	buffer_write( global.tempSave[room], buffer_f32, alarm[0] );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	alert = buffer_read(global.tempSave[room], buffer_u8 );
	energie = buffer_read(global.tempSave[room], buffer_f32 );
	angle = buffer_read(global.tempSave[room], buffer_f32 );
	checkreload = buffer_read(global.tempSave[room], buffer_f32 );
	light = buffer_read(global.tempSave[room], buffer_f32 );
	alarm[0] = buffer_read(global.tempSave[room], buffer_f32 );
}