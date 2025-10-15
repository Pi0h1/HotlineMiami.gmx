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
nextroom = room_next(room);
global.combo = 0;
global.combotime = 0;
combo = 0;
width = display_get_width();
height = display_get_height();
global.mousex = (display_mouse_get_x() - width * 0.5) * (camera_get_view_width(view_camera[0]) / width);
global.mousey = (display_mouse_get_y() - height * 0.5) * (camera_get_view_height(view_camera[0]) / height);
global.done = 0;

DoSave = function(buf) {
	// basic vars
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
	buffer_write( buf, buffer_f32, image_speed );
	buffer_write( buf, buffer_f32, action );
	buffer_write( buf, buffer_f32, wait );
	buffer_write( buf, buffer_f32, phonex );
	buffer_write( buf, buffer_f32, nextroom );
	buffer_write( buf, buffer_u32, width );
	buffer_write( buf, buffer_u32, height );
	buffer_write( buf, buffer_f32, global.mousex );
	buffer_write( buf, buffer_f32, global.mousey );




}
DoLoad = function(buf) {
	// basic vars
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
	image_speed = buffer_read(buf, buffer_f32 );
	action = buffer_read(buf, buffer_f32 );
	wait = buffer_read(buf, buffer_f32 );
	phonex = buffer_read(buf, buffer_f32 );
	nextroom = buffer_read(buf, buffer_f32 );
	width = buffer_read(buf, buffer_u32 );
	height = buffer_read(buf, buffer_u32 );
	global.mousex = buffer_read(buf, buffer_f32 );
	global.mousey = buffer_read(buf, buffer_f32 );
}