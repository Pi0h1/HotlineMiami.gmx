image_speed = 0;
image_index = 0;
angle = random(360);
direction = angle;
speed = round(random(1));
image_speed = speed * 0.1;
alarm[0] = 60 + random(60);
energie = round(random(1));
checkreload = floor(random(8));
alert = 0;
light = 0;
talked = 0;
dist = 0;
dir = 0;
pdir = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_u8, alert );
	buffer_write( buf, buffer_u8, talked );
	buffer_write( buf, buffer_f32, energie );
	buffer_write( buf, buffer_f32, angle );
	buffer_write( buf, buffer_f32, checkreload );
	buffer_write( buf, buffer_f32, light );
	buffer_write( buf, buffer_f32, alarm[0] );
	buffer_write( buf, buffer_f32, dist );
	buffer_write( buf, buffer_f32, dir );
	buffer_write( buf, buffer_f32, pdir );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	alert = buffer_read(buf, buffer_u8 );
	talked = buffer_read(buf, buffer_u8 );
	energie = buffer_read(buf, buffer_f32 );
	angle = buffer_read(buf, buffer_f32 );
	checkreload = buffer_read(buf, buffer_f32 );
	light = buffer_read(buf, buffer_f32 );
	alarm[0] = buffer_read(buf, buffer_f32 );
	dist = buffer_read(buf, buffer_f32 );
	dir = buffer_read(buf, buffer_f32 );
	pdir = buffer_read(buf, buffer_f32 );
}