image_speed = 0;
image_index = 0;
speed = 0;
image_speed = 0;
energie = 2;

my_path = path_add();
path_set_kind(my_path, 1);
path_set_precision(my_path, 2);
reload = 0;
light = 0;

state = 0;

direction = 90;
sprite_index = sprBoss2Walk;
attack = 0;
pdir = point_direction(objPlayer.x, objPlayer.y, x, y);
diradd = 1;
turnwait = 0;
wait = 700;
attackwait = 0;
vol = 1;
ammo = 0;
test = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, energie );
	buffer_write( global.tempSave[room], buffer_u16, state );
	buffer_write( global.tempSave[room], buffer_f32, wait );
	buffer_write( global.tempSave[room], buffer_f32, reload );
	buffer_write( global.tempSave[room], buffer_f32, light );
	buffer_write( global.tempSave[room], buffer_u8, attack );
	buffer_write( global.tempSave[room], buffer_f32, attackwait );
	buffer_write( global.tempSave[room], buffer_f32, pdir );
	buffer_write( global.tempSave[room], buffer_f32, diradd );
	buffer_write( global.tempSave[room], buffer_f32, turnwait );
	buffer_write( global.tempSave[room], buffer_f16, vol );
	buffer_write( global.tempSave[room], buffer_f16, ammo );
	buffer_write( global.tempSave[room], buffer_f16, test );


}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	energie = buffer_read(global.tempSave[room], buffer_f32 );
	state = buffer_read(global.tempSave[room], buffer_u16 );
	wait = buffer_read(global.tempSave[room], buffer_f32 );
	reload = buffer_read(global.tempSave[room], buffer_f32 );
	light = buffer_read(global.tempSave[room], buffer_f32 );
	attack = buffer_read(global.tempSave[room], buffer_u8 );
	attackwait = buffer_read(global.tempSave[room], buffer_f32 );
	pdir = buffer_read(global.tempSave[room], buffer_f32 );
	diradd = buffer_read(global.tempSave[room], buffer_f32 );
	turnwait = buffer_read(global.tempSave[room], buffer_f32 );
	vol = buffer_read(global.tempSave[room], buffer_f16 );
	ammo = buffer_read(global.tempSave[room], buffer_f16 );
	test = buffer_read(global.tempSave[room], buffer_f16 );
}