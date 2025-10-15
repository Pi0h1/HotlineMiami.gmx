image_speed = 0;
image_index = 0;
reload = floor(random(10));
alert = 0;
alarm[0] = 10 + random(100);
direction = random(360);
ammo = 0;
path = path_add();

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, reload );
	buffer_write( buf, buffer_f32, alert );
	buffer_write( buf, buffer_f32, ammo );
}

DoLoad = function(buf) {
	scrLoadGeneric(buf);
	reload = buffer_read(buf, buffer_f32 );
	alert = buffer_read(buf, buffer_f32 );
	ammo = buffer_read(buf, buffer_f32 );
}	