image_speed = 0.1;
shotgunned = 0;
hits = 0;
blood = 120;
//wait = 0;
reload = 0;

state = 0;
wait = 40;
path = -1234;

alarm[0] = 1;
ammo = 10;
scrInitPathFinding();

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, shotgunned );
	buffer_write( buf, buffer_f32, hits );
	buffer_write( buf, buffer_f32, blood );
	buffer_write( buf, buffer_f32, wait );
	buffer_write( buf, buffer_f32, reload );
	buffer_write( buf, buffer_f32, state );
	buffer_write( buf, buffer_f32, path );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	shotgunned = buffer_read(buf, buffer_f32 );
	hits = buffer_read(buf, buffer_f32 );
	blood = buffer_read(buf, buffer_f32 );
	wait = buffer_read(buf, buffer_f32 );
	reload = buffer_read(buf, buffer_f32 );
	state = buffer_read(buf, buffer_f32 );
	path = buffer_read(buf, buffer_f32 );
}