image_speed = 0.15;
image_index = random(1000);
reload = floor(random(10));
alert = 0;
ammo = 0;
path = path_add();
with (instance_nearest(x, y, objToilet)) {
    image_index = 0;
}

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