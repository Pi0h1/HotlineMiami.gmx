direction = random(360);
speed = choose(0, 1);
alarm[0] = 100 + random(300);
image_speed = speed * 0.15;
ammo = 30;
checkreload = 10;
reload = 12;
energie = 0;

DoSave = function(buf) {
	buffer_write( buf, buffer_f32, image_speed );
	buffer_write( buf, buffer_f32, direction );
	buffer_write( buf, buffer_f32, speed );
	buffer_write( buf, buffer_f32, energie );
	buffer_write( buf, buffer_f32, ammo );
	buffer_write( buf, buffer_f32, checkreload );
	buffer_write( buf, buffer_f32, reload );
}

DoLoad = function(buf) {
	image_speed = buffer_read(buf, buffer_f32 );
	direction = buffer_read(buf, buffer_f32 );
	speed = buffer_read(buf, buffer_f32 );
	energie = buffer_read(buf, buffer_f32 );
	ammo = buffer_read(buf, buffer_f32 );
	checkreload = buffer_read(buf, buffer_f32 );
	reload = buffer_read(buf, buffer_f32 );
}