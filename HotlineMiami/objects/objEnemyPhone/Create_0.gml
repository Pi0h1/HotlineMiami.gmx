image_speed = 0;
image_index = 0;
reload = floor(random(10));
alert = 0;
direction = random(360);
ammo = 0;
path = path_add();
on = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, reload );
	buffer_write( buf, buffer_f32, alert );
	buffer_write( buf, buffer_f32, ammo );
	buffer_write( buf, buffer_u8, on );
}

DoLoad = function(buf) {
	scrLoadGeneric(buf);
	reload = buffer_read(buf, buffer_f32 );
	alert = buffer_read(buf, buffer_f32 );
	ammo = buffer_read(buf, buffer_f32 );
	on = buffer_read(buf, buffer_u8 );
}	