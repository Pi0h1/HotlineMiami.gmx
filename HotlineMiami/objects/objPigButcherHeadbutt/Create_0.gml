image_index = 0;
image_speed = 0;
ammo = 0;
bled = 0;
bold = 400;
kill = 200;
global.shake = 4;
audio_play_sound(sndHitWall, 0, false);
viewspeed = 0;
viewdir = 0;
vdist = 0;
vdir = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, bled );
	buffer_write( buf, buffer_f32, ammo );
	buffer_write( buf, buffer_f32, bold );
	buffer_write( buf, buffer_f32, kill );
	buffer_write(buf, buffer_f32, viewspeed);
	buffer_write(buf, buffer_f32, viewdir);
	buffer_write(buf, buffer_f32, vdist);
	buffer_write(buf, buffer_f32, vdir);

}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	bled = buffer_read(buf, buffer_f32 );
	ammo = buffer_read(buf, buffer_f32 );
	bold = buffer_read(buf, buffer_f32 );
	kill = buffer_read(buf, buffer_f32 );
	viewspeed = buffer_read(buf, buffer_f32);
	viewdir = buffer_read(buf, buffer_f32);
	vdist = buffer_read(buf, buffer_f32);
	vdir = buffer_read(buf, buffer_f32);
}