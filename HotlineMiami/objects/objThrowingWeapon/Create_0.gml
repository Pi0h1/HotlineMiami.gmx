friction = 0.1;
diradd = -1 + round(random(1)) * 2;
angle = random(360);
left = -1 + round(random(1)) * 2;
image_speed = 0;
ammo = 0;
hits = 0;
bounce = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, ammo );
	buffer_write( buf, buffer_f32, diradd );
	buffer_write( buf, buffer_f32, angle );
	buffer_write( buf, buffer_f32, left );
	buffer_write( buf, buffer_f32, hits );
	buffer_write( buf, buffer_f32, bounce );
	
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	ammo = buffer_read(buf, buffer_f32 );
	diradd = buffer_read(buf, buffer_f32 );
	angle = buffer_read(buf, buffer_f32 );
	left = buffer_read(buf, buffer_f32 );
	hits = buffer_read(buf, buffer_f32 );
	bounce = buffer_read(buf, buffer_f32 );
}