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

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, energie );
	buffer_write( buf, buffer_u16, state );
	buffer_write( buf, buffer_f32, wait );
	buffer_write( buf, buffer_f32, reload );
	buffer_write( buf, buffer_f32, light );
	buffer_write( buf, buffer_u8, attack );
	buffer_write( buf, buffer_f32, attackwait );
	buffer_write( buf, buffer_f32, pdir );
	buffer_write( buf, buffer_f32, diradd );
	buffer_write( buf, buffer_f32, turnwait );
	buffer_write( buf, buffer_f16, vol );
	buffer_write( buf, buffer_f16, ammo );
	buffer_write( buf, buffer_f16, test );


}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	energie = buffer_read(buf, buffer_f32 );
	state = buffer_read(buf, buffer_u16 );
	wait = buffer_read(buf, buffer_f32 );
	reload = buffer_read(buf, buffer_f32 );
	light = buffer_read(buf, buffer_f32 );
	attack = buffer_read(buf, buffer_u8 );
	attackwait = buffer_read(buf, buffer_f32 );
	pdir = buffer_read(buf, buffer_f32 );
	diradd = buffer_read(buf, buffer_f32 );
	turnwait = buffer_read(buf, buffer_f32 );
	vol = buffer_read(buf, buffer_f16 );
	ammo = buffer_read(buf, buffer_f16 );
	test = buffer_read(buf, buffer_f16 );
}