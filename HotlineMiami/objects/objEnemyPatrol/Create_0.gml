scrEPatrolInit();

image_speed = 0;
image_index = random(1000);
speed = 1;
image_speed = 0.1;
energie = round(random(1));

checkreload = floor(random(30));
ammo = 24;
alert = 0;
reload = 13;
light = 0;
start_x = x;
start_y = y;
weaponfind = 0;
angle = direction;
shake = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, energie );
	buffer_write( global.tempSave[room], buffer_f32, checkreload );
	buffer_write( global.tempSave[room], buffer_f32, ammo );
	buffer_write( global.tempSave[room], buffer_f32, alert );
	buffer_write( global.tempSave[room], buffer_f32, reload );
	buffer_write( global.tempSave[room], buffer_f32, light );
	buffer_write( global.tempSave[room], buffer_f32, start_x );
	buffer_write( global.tempSave[room], buffer_f32, start_y );
	buffer_write( global.tempSave[room], buffer_f32, weaponfind );
	buffer_write( global.tempSave[room], buffer_f32, angle );
	buffer_write( global.tempSave[room], buffer_f32, shake );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	energie = buffer_read(global.tempSave[room], buffer_f32 );
	checkreload = buffer_read(global.tempSave[room], buffer_f32 );
	ammo = buffer_read(global.tempSave[room], buffer_f32 );
	alert = buffer_read(global.tempSave[room], buffer_f32 );
	reload = buffer_read(global.tempSave[room], buffer_f32 );
	light = buffer_read(global.tempSave[room], buffer_f32 );
	start_x = buffer_read(global.tempSave[room], buffer_f32 );
	start_y = buffer_read(global.tempSave[room], buffer_f32 );
	weaponfind = buffer_read(global.tempSave[room], buffer_f32 );
	angle = buffer_read(global.tempSave[room], buffer_f32 );
	shake = buffer_read(global.tempSave[room], buffer_f32 );
}