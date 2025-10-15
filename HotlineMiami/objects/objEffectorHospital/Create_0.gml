alpha = 1;
coldir = 0;
amount = 0;
fade = 0;
my_y = 0;
global.dir = 0;
restart = 0;
update = 0;
dir = 0;
ammoy = -32;
next = 0;
showfinished = 0;
image_speed = 0.4;
action = 0;
wait = 0;
phonex = 0;
blackx = 15;
line1x = 0;
line2x = 0;
nextroom = room_next(room);
newsong = 0;
song = -1;
index = 0;
show_date = 0;
sprite = sprPhone;
if (room == rmHospitalTopFloor)
    scrShowDate(room);
start = 1;
//global.loaded = 0;
width = display_get_width();
height = display_get_height();
global.mousex = (display_mouse_get_x() - width * 0.5) * (camera_get_view_width(view_camera[0]) / width);
global.mousey = (display_mouse_get_y() - height * 0.5) * (camera_get_view_height(view_camera[0]) / height);
black = 0;
scrInitXboxButtons();


DoSave = function(buf) {
	
	// save xbox vars
	// NOTE: THIS WILL BREAK IF GLOBAL.XBOX IS CHANGED INGAME.
	if (global.xbox) {
		buffer_write( buf, buffer_f32, presstart );
		buffer_write( buf, buffer_f32, pressup );
		buffer_write( buf, buffer_f32, pressdown );
		buffer_write( buf, buffer_f32, pressleft );
		buffer_write( buf, buffer_f32, pressright );
		buffer_write( buf, buffer_f32, pressback );
		buffer_write( buf, buffer_f32, pressltrig );
		buffer_write( buf, buffer_f32, pressrtrig );
		buffer_write( buf, buffer_f32, presslb );
		buffer_write( buf, buffer_f32, pressrb );
		buffer_write( buf, buffer_f32, pressrstick );
		buffer_write( buf, buffer_f32, presslstick );
		buffer_write( buf, buffer_f32, pressa );
	}

	// basic vars
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f16, alpha );
	buffer_write( buf, buffer_f32, coldir );
	buffer_write( buf, buffer_f32, amount );
	buffer_write( buf, buffer_u8, fade );
	buffer_write( buf, buffer_f32, my_y );
	buffer_write( buf, buffer_f32, global.dir );
	buffer_write( buf, buffer_u8, restart );
	buffer_write( buf, buffer_f32, update );
	buffer_write( buf, buffer_f32, dir );
	buffer_write( buf, buffer_f32, ammoy );
	buffer_write( buf, buffer_f32, next );
	buffer_write( buf, buffer_f32, showfinished );
	buffer_write( buf, buffer_f32, action );
	buffer_write( buf, buffer_f32, wait );
	buffer_write( buf, buffer_f32, phonex );
	buffer_write( buf, buffer_f32, line1x );
	buffer_write( buf, buffer_f32, line2x );
	buffer_write( buf, buffer_f32, nextroom );
	buffer_write( buf, buffer_f32, newsong );
	buffer_write( buf, buffer_f32, song );
	buffer_write( buf, buffer_f32, blackx );
	buffer_write( buf, buffer_u32, width );
	buffer_write( buf, buffer_u32, height );
	buffer_write( buf, buffer_f32, global.mousex );
	buffer_write( buf, buffer_f32, global.mousey );
	buffer_write( buf, buffer_u32, sprite );
	buffer_write( buf, buffer_u8, show_date );
	buffer_write( buf, buffer_u8, start );
	buffer_write( buf, buffer_f16, index );

}
DoLoad = function(buf) {
	// load xbox vars
	// NOTE: THIS WILL BREAK IF GLOBAL.XBOX IS CHANGED INGAME.
	if (global.xbox) {
		presstart = buffer_read(buf, buffer_f32 );
		pressup = buffer_read(buf, buffer_f32 );
		pressdown = buffer_read(buf, buffer_f32 );
		pressleft = buffer_read(buf, buffer_f32 );
		pressright = buffer_read(buf, buffer_f32 );
		pressback = buffer_read(buf, buffer_f32 );
		pressltrig = buffer_read(buf, buffer_f32 );
		pressrtrig = buffer_read(buf, buffer_f32 );
		presslb = buffer_read(buf, buffer_f32 );
		pressrb = buffer_read(buf, buffer_f32 );
		pressrstick = buffer_read(buf, buffer_f32 );
		presslstick = buffer_read(buf, buffer_f32 );
		pressa = buffer_read(buf, buffer_f32 );
	}

	// basic vars
	scrLoadGeneric(buf);
	alpha = buffer_read(buf, buffer_f16 );
	coldir = buffer_read(buf, buffer_f32 );
	amount = buffer_read(buf, buffer_f32 );
	fade = buffer_read(buf, buffer_u8 );
	my_y = buffer_read(buf, buffer_f32 );
	global.dir = buffer_read(buf, buffer_f32 );
	restart = buffer_read(buf, buffer_u8 );
	update = buffer_read(buf, buffer_f32 );
	dir = buffer_read(buf, buffer_f32 );
	ammoy = buffer_read(buf, buffer_f32 );
	next = buffer_read(buf, buffer_f32 );
	showfinished = buffer_read(buf, buffer_f32 );
	action = buffer_read(buf, buffer_f32 );
	wait = buffer_read(buf, buffer_f32 );
	phonex = buffer_read(buf, buffer_f32 );
	line1x = buffer_read(buf, buffer_f32 );
	line2x = buffer_read(buf, buffer_f32 );
	nextroom = buffer_read(buf, buffer_f32 );
	newsong = buffer_read(buf, buffer_f32 );
	song = buffer_read(buf, buffer_f32 );
	blackx = buffer_read(buf, buffer_f32 );
	width = buffer_read(buf, buffer_u32 );
	height = buffer_read(buf, buffer_u32 );
	global.mousex = buffer_read(buf, buffer_f32 );
	global.mousey = buffer_read(buf, buffer_f32 );
	sprite = buffer_read(buf, buffer_u32 );
	show_date = buffer_read(buf, buffer_u8 );
	start = buffer_read(buf, buffer_u8 );
	index = buffer_read(buf, buffer_f16 );
}
