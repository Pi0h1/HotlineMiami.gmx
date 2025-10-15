image_index = 1;
image_speed = 0;
ammo = 0;
bled = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
dir = 0;
viewspeed = 0;
viewdir = 0;
vdist = 0;
vdir = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, dir );
	buffer_write( buf, buffer_f32, bled );
	buffer_write( buf, buffer_f32, ammo );
	buffer_write(buf, buffer_f32, viewspeed);
	buffer_write(buf, buffer_f32, viewdir);
	buffer_write(buf, buffer_f32, vdist);
	buffer_write(buf, buffer_f32, vdir);

}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	dir = buffer_read(buf, buffer_f32 );
	bled = buffer_read(buf, buffer_f32 );
	ammo = buffer_read(buf, buffer_f32 );
	viewspeed = buffer_read(buf, buffer_f32);
	viewdir = buffer_read(buf, buffer_f32);
	vdist = buffer_read(buf, buffer_f32);
	vdir = buffer_read(buf, buffer_f32);
}