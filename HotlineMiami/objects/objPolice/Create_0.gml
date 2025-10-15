scrPoliceRandomInit();

image_speed = 0;
image_index = random(1000);
angle = random(360);

direction = angle;
speed = round(random(1));
image_speed = speed * 0.1;
alarm[0] = 60 + random(60);
energie = round(random(1));

checkreload = floor(random(30));
ammo = 24;
alert = 0;
reload = 13;
light = 0;

weaponfind = 0;
shake = 0;


DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, energie );
	buffer_write( buf, buffer_f32, checkreload );
	buffer_write( buf, buffer_f32, ammo );
	buffer_write( buf, buffer_f32, alert );
	buffer_write( buf, buffer_f32, reload );
	buffer_write( buf, buffer_f32, light );
	buffer_write( buf, buffer_u8, weaponfind );
	buffer_write( buf, buffer_f32, shake );
	buffer_write( buf, buffer_f32, angle );
	buffer_write( buf, buffer_f32, check );
	buffer_write( buf, buffer_f32, startx );
	buffer_write( buf, buffer_f32, starty );
	buffer_write( buf, buffer_f32, startdir );
	buffer_write( buf, buffer_f32, returning );
	buffer_write( buf, buffer_f32, armed );
	buffer_write( buf, buffer_f32, turn );
	buffer_write( buf, buffer_f32, alertwait );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	energie = buffer_read(buf, buffer_f32 );
	checkreload = buffer_read(buf, buffer_f32 );
	ammo = buffer_read(buf, buffer_f32 );
	alert = buffer_read(buf, buffer_f32 );
	reload = buffer_read(buf, buffer_f32 );
	light = buffer_read(buf, buffer_f32 );
	weaponfind = buffer_read(buf, buffer_u8 );
	shake = buffer_read(buf, buffer_f32 );
	angle = buffer_read(buf, buffer_f32 );
	check = buffer_read(buf, buffer_f32 );
	startx = buffer_read(buf, buffer_f32 );
	starty = buffer_read(buf, buffer_f32 );
	startdir = buffer_read(buf, buffer_f32 );
	returning = buffer_read(buf, buffer_f32 );
	armed = buffer_read(buf, buffer_f32 );
	turn = buffer_read(buf, buffer_f32 );
	alertwait = buffer_read(buf, buffer_f32 );
}