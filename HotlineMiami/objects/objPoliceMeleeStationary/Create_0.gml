scrPoliceMeleeStationaryInit();
image_speed = 0;
image_index = random(1000);
image_speed = 0;
energie = round(random(1));
direction = random(360);
my_path = path_add();
path_set_kind(my_path, 1);
path_set_precision(my_path, 2);
checkreload = floor(random(30));
ammo = 24;
alert = 0;
reload = 13;
light = 0;
start_x = x;
start_y = y;
weaponfind = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, energie );
	buffer_write( buf, buffer_f32, checkreload );
	buffer_write( buf, buffer_f32, ammo );
	buffer_write( buf, buffer_f32, alert );
	buffer_write( buf, buffer_f32, reload );
	buffer_write( buf, buffer_f32, light );
	buffer_write( buf, buffer_f32, start_x );
	buffer_write( buf, buffer_f32, start_y );
	buffer_write( buf, buffer_u8, weaponfind );
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
	start_x = buffer_read(buf, buffer_f32 );
	start_y = buffer_read(buf, buffer_f32 );
	weaponfind = buffer_read(buf, buffer_u8 );
	check = buffer_read(buf, buffer_f32 );
	startx = buffer_read(buf, buffer_f32 );
	starty = buffer_read(buf, buffer_f32 );
	startdir = buffer_read(buf, buffer_f32 );
	returning = buffer_read(buf, buffer_f32 );
	armed = buffer_read(buf, buffer_f32 );
	turn = buffer_read(buf, buffer_f32 );
	alertwait = buffer_read(buf, buffer_f32 );
}