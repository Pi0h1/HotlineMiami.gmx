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

DoSave = function() {
	
	// save xbox vars
	// NOTE: THIS WILL BREAK IF GLOBAL.XBOX IS CHANGED INGAME.
	if (global.xbox) {
		buffer_write( global.tempSave[room], buffer_f32, presstart );
		buffer_write( global.tempSave[room], buffer_f32, pressup );
		buffer_write( global.tempSave[room], buffer_f32, pressdown );
		buffer_write( global.tempSave[room], buffer_f32, pressleft );
		buffer_write( global.tempSave[room], buffer_f32, pressright );
		buffer_write( global.tempSave[room], buffer_f32, pressback );
		buffer_write( global.tempSave[room], buffer_f32, pressltrig );
		buffer_write( global.tempSave[room], buffer_f32, pressrtrig );
		buffer_write( global.tempSave[room], buffer_f32, presslb );
		buffer_write( global.tempSave[room], buffer_f32, pressrb );
		buffer_write( global.tempSave[room], buffer_f32, pressrstick );
		buffer_write( global.tempSave[room], buffer_f32, presslstick );
		buffer_write( global.tempSave[room], buffer_f32, pressa );
	}

	// basic vars
	buffer_write( global.tempSave[room], buffer_f32, alpha );
	buffer_write( global.tempSave[room], buffer_f32, coldir );
	buffer_write( global.tempSave[room], buffer_f32, amount );
	buffer_write( global.tempSave[room], buffer_f32, fade );
	buffer_write( global.tempSave[room], buffer_f32, my_y );
	buffer_write( global.tempSave[room], buffer_f32, global.dir );
	buffer_write( global.tempSave[room], buffer_f32, restart );
	buffer_write( global.tempSave[room], buffer_f32, update );
	buffer_write( global.tempSave[room], buffer_f32, dir );
	buffer_write( global.tempSave[room], buffer_f32, ammoy );
	buffer_write( global.tempSave[room], buffer_f32, next );
	buffer_write( global.tempSave[room], buffer_f32, showfinished );
	buffer_write( global.tempSave[room], buffer_f32, image_speed );
	buffer_write( global.tempSave[room], buffer_f32, action );
	buffer_write( global.tempSave[room], buffer_f32, wait );
	buffer_write( global.tempSave[room], buffer_f32, phonex );
	buffer_write( global.tempSave[room], buffer_f32, line1x );
	buffer_write( global.tempSave[room], buffer_f32, line2x );
	buffer_write( global.tempSave[room], buffer_f32, nextroom );
	buffer_write( global.tempSave[room], buffer_f32, newsong );
	buffer_write( global.tempSave[room], buffer_f32, song );
	buffer_write( global.tempSave[room], buffer_f32, blackx );
	buffer_write( global.tempSave[room], buffer_f32, bamount );
	buffer_write( global.tempSave[room], buffer_u32, width );
	buffer_write( global.tempSave[room], buffer_u32, height );
	buffer_write( global.tempSave[room], buffer_f32, global.mousex );
	buffer_write( global.tempSave[room], buffer_f32, global.mousey );
	buffer_write( global.tempSave[room], buffer_u32, sprite );
	buffer_write( global.tempSave[room], buffer_f32, show_date );

}
DoLoad = function() {
	// load xbox vars
	// NOTE: THIS WILL BREAK IF GLOBAL.XBOX IS CHANGED INGAME.
	if (global.xbox) {
		presstart = buffer_read(global.tempSave[room], buffer_f32 );
		pressup = buffer_read(global.tempSave[room], buffer_f32 );
		pressdown = buffer_read(global.tempSave[room], buffer_f32 );
		pressleft = buffer_read(global.tempSave[room], buffer_f32 );
		pressright = buffer_read(global.tempSave[room], buffer_f32 );
		pressback = buffer_read(global.tempSave[room], buffer_f32 );
		pressltrig = buffer_read(global.tempSave[room], buffer_f32 );
		pressrtrig = buffer_read(global.tempSave[room], buffer_f32 );
		presslb = buffer_read(global.tempSave[room], buffer_f32 );
		pressrb = buffer_read(global.tempSave[room], buffer_f32 );
		pressrstick = buffer_read(global.tempSave[room], buffer_f32 );
		presslstick = buffer_read(global.tempSave[room], buffer_f32 );
		pressa = buffer_read(global.tempSave[room], buffer_f32 );
	}

	// basic vars
	alpha = buffer_read(global.tempSave[room], buffer_f32 );
	coldir = buffer_read(global.tempSave[room], buffer_f32 );
	amount = buffer_read(global.tempSave[room], buffer_f32 );
	fade = buffer_read(global.tempSave[room], buffer_f32 );
	my_y = buffer_read(global.tempSave[room], buffer_f32 );
	global.dir = buffer_read(global.tempSave[room], buffer_f32 );
	restart = buffer_read(global.tempSave[room], buffer_f32 );
	update = buffer_read(global.tempSave[room], buffer_f32 );
	dir = buffer_read(global.tempSave[room], buffer_f32 );
	ammoy = buffer_read(global.tempSave[room], buffer_f32 );
	next = buffer_read(global.tempSave[room], buffer_f32 );
	showfinished = buffer_read(global.tempSave[room], buffer_f32 );
	image_speed = buffer_read(global.tempSave[room], buffer_f32 );
	action = buffer_read(global.tempSave[room], buffer_f32 );
	wait = buffer_read(global.tempSave[room], buffer_f32 );
	phonex = buffer_read(global.tempSave[room], buffer_f32 );
	line1x = buffer_read(global.tempSave[room], buffer_f32 );
	line2x = buffer_read(global.tempSave[room], buffer_f32 );
	nextroom = buffer_read(global.tempSave[room], buffer_f32 );
	newsong = buffer_read(global.tempSave[room], buffer_f32 );
	song = buffer_read(global.tempSave[room], buffer_f32 );
	blackx = buffer_read(global.tempSave[room], buffer_f32 );
	bamount = buffer_read(global.tempSave[room], buffer_f32 );
	width = buffer_read(global.tempSave[room], buffer_u32 );
	height = buffer_read(global.tempSave[room], buffer_u32 );
	global.mousex = buffer_read(global.tempSave[room], buffer_f32 );
	global.mousey = buffer_read(global.tempSave[room], buffer_f32 );
	sprite = buffer_read(global.tempSave[room], buffer_u32 );
	show_date = buffer_read(global.tempSave[room], buffer_f32 );
}
