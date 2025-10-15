image_speed = 0;
active = 1;
scrInitMaskPos();
last_sprite = sprite_index;
valid = 1;
vdist = 0;
vdir = 0;
viewspeed = 0;
viewdir = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_u8, active );
	buffer_write( buf, buffer_u32, last_sprite );
	buffer_write( buf, buffer_u8, valid );
	buffer_write( buf, buffer_f32, vdist );
	buffer_write( buf, buffer_f32, vdir );
	buffer_write( buf, buffer_f32, viewspeed );
	buffer_write( buf, buffer_f32, viewdir );

}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	active = buffer_read(buf, buffer_u8 );
	last_sprite = buffer_read(buf, buffer_u32 );
	valid = buffer_read(buf, buffer_u8 );
	vdist = buffer_read(buf, buffer_f32 );
	vdir = buffer_read(buf, buffer_f32 );
	viewspeed = buffer_read(buf, buffer_f32 );
	viewdir = buffer_read(buf, buffer_f32 );
}