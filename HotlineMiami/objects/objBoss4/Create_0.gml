state = 0;
wait = 60;
dir = 0;
ammo = 0;
image_speed = 0;
alarm[0] = 100 + random(200);
global.done = 0;
scrInitPathFinding();

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_u16, state );
	buffer_write( buf, buffer_f32, wait );
	buffer_write( buf, buffer_f32, alarm[0] );
	buffer_write( buf, buffer_f32, dir );
	buffer_write( buf, buffer_f32, ammo );

}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	state = buffer_read(buf, buffer_u16 );
	wait = buffer_read(buf, buffer_f32 );
	alarm[0] = buffer_read(buf, buffer_f32 );
	dir = buffer_read(buf, buffer_f32 );
	ammo = buffer_read(buf, buffer_f32 );
}