/// @description Weapons
sprite_index = choose(sprEWalkClub, sprEWalkPipe, sprEWalkKnife, sprEWalkBat);
ammo = 0;

scrEMeleeInit();
image_speed = 0;
image_index = random(1000);
speed = 1;
image_speed = 0.1;
energie = round(random(1));

my_path = path_add();
path_set_kind(my_path, 1);
path_set_precision(my_path, 2);
checkreload = floor(random(30));
ammo = 24;
alert = 0;
reload = 0;
light = 0;
start_x = x;
start_y = y;
stopchase = 0;
weaponfind = 0;
lastsprite = sprite_index;

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
	buffer_write( global.tempSave[room], buffer_f32, stopchase );
	buffer_write( global.tempSave[room], buffer_f32, weaponfind );
	buffer_write( global.tempSave[room], buffer_u32, lastsprite );
	buffer_write( global.tempSave[room], buffer_f32, angle );
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
	stopchase = buffer_read(global.tempSave[room], buffer_f32 );
	weaponfind = buffer_read(global.tempSave[room], buffer_f32 );
	angle = buffer_read(global.tempSave[room], buffer_f32 );
	lastsprite = buffer_read(global.tempSave[room], buffer_u32 );
}