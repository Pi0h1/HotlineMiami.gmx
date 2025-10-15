image_index = 1;
image_speed = 0;
ammo = 0;
bled = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
bag = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, bag );
	buffer_write( buf, buffer_f32, dir );
	buffer_write( buf, buffer_f32, bled );
	buffer_write( buf, buffer_f32, ammo );
	buffer_write( buf, buffer_f16, hurtindex );
	buffer_write( buf, buffer_f16, targetindex );
	buffer_write(buf, buffer_f32, viewspeed);
	buffer_write(buf, buffer_f32, viewdir);
	buffer_write(buf, buffer_f32, vdist);
	buffer_write(buf, buffer_f32, vdir);

}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	bag = buffer_read(buf, buffer_f32 );
	dir = buffer_read(buf, buffer_f32 );
	bled = buffer_read(buf, buffer_f32 );
	ammo = buffer_read(buf, buffer_f32 );
	hurtindex = buffer_read(buf, buffer_f16 );
	targetindex = buffer_read(buf, buffer_f16 );
	viewspeed = buffer_read(buf, buffer_f32);
	viewdir = buffer_read(buf, buffer_f32);
	vdist = buffer_read(buf, buffer_f32);
	vdir = buffer_read(buf, buffer_f32);
}