alpha = 1;
global.enemy = -124123;
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

// change to a switch statement later
if (room == rmSequence1 || room == rmSequence2 || room == rmSequence3 || room == rmSequence4 || room == rmSequence5 || room == rmSequence6 || room == rmSequence7 || room == rmSequence8 || room == rmSequence9 || room == rmSequence10 || room == rmSequence11 || room == rmSequence12 || room == rmSequence14 || room == rmHospitalTopFloor || room == rmMCBar || room == rmMCSequence2 || room == rmMCSequence3 || room == rmMCSequence4) {
    scrShowDate(room);
    start = 1;
} else start = 0;
if (room == rmSequence13Downstairs)
    start = 1;
//global.loaded = 0;
width = display_get_width();
height = display_get_height();
global.mousex = (display_mouse_get_x() - width * 0.5) * (camera_get_view_width(view_camera[0]) / width);
global.mousey = (display_mouse_get_y() - height * 0.5) * (camera_get_view_height(view_camera[0]) / height);
lastbrus = 0;
brus = 0;
ammoy = -32;
levelshow = 240;
if (room == rmMansionMainHall)
    save = 1;
else save = 0;
leveltitle = "";
if (instance_exists(objPlayerBiker)) {
    switch (room) {
        case rmNoodleShop: leveltitle = "North East 56th St"; break;
        case rmArcadeDownstairs: leveltitle = "South West 107th Place"; break;
        case rmPhoneHomEntranceBiker: leveltitle = "North West 342nd St"; break;
        case rmJanitors: leveltitle = "North 87th Place"; break;
    }
}
scrLockInEffectInit();

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f16, alpha );
	buffer_write( buf, buffer_f32, global.enemy );
	buffer_write( buf, buffer_f32, coldir );
	buffer_write( buf, buffer_f32, amount );
	buffer_write( buf, buffer_u8, fade );
	buffer_write( buf, buffer_f32, my_y );
	buffer_write( buf, buffer_f32, global.dir );
	buffer_write( buf, buffer_u8, restart );
	buffer_write( buf, buffer_f32, update );
	buffer_write( buf, buffer_f32, ammoy );
	buffer_write( buf, buffer_f32, next );
	buffer_write( buf, buffer_f32, showfinished );
	buffer_write( buf, buffer_f32, image_speed );
	buffer_write( buf, buffer_f32, action );
	buffer_write( buf, buffer_f32, wait );
	buffer_write( buf, buffer_f32, phonex );
	buffer_write( buf, buffer_f32, blackx );
	buffer_write( buf, buffer_f32, line1x );
	buffer_write( buf, buffer_f32, line2x );
	buffer_write( buf, buffer_f32, nextroom );
	buffer_write( buf, buffer_f32, newsong );
	buffer_write( buf, buffer_f32, song );
	buffer_write( buf, buffer_f16, index );
	buffer_write( buf, buffer_u8, show_date );
	buffer_write( buf, buffer_u32, sprite );
	buffer_write( buf, buffer_u8, start );
	buffer_write( buf, buffer_f32, global.loaded );
	buffer_write( buf, buffer_f32, width );
	buffer_write( buf, buffer_f32, height );
	buffer_write( buf, buffer_f32, global.mousex );
	buffer_write( buf, buffer_f32, global.mousey );
	buffer_write( buf, buffer_f32, lastbrus );
	buffer_write( buf, buffer_f32, brus );
	buffer_write( buf, buffer_f32, ammoy );
	buffer_write( buf, buffer_f32, levelshow );
	buffer_write( buf, buffer_f32, save );
	buffer_write( buf, buffer_string, leveltitle );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	alpha = buffer_read(buf, buffer_f16 );
	global.enemy = buffer_read(buf, buffer_f32 );
	coldir = buffer_read(buf, buffer_f32 );
	amount = buffer_read(buf, buffer_f32 );
	fade = buffer_read(buf, buffer_u8 );
	my_y = buffer_read(buf, buffer_f32 );
	global.dir = buffer_read(buf, buffer_f32 );
	restart = buffer_read(buf, buffer_u8 );
	update = buffer_read(buf, buffer_f32 );
	ammoy = buffer_read(buf, buffer_f32 );
	next = buffer_read(buf, buffer_f32 );
	showfinished = buffer_read(buf, buffer_f32 );
	image_speed = buffer_read(buf, buffer_f32 );
	action = buffer_read(buf, buffer_f32 );
	wait = buffer_read(buf, buffer_f32 );
	phonex = buffer_read(buf, buffer_f32 );
	blackx = buffer_read(buf, buffer_f32 );
	line1x = buffer_read(buf, buffer_f32 );
	line2x = buffer_read(buf, buffer_f32 );
	nextroom = buffer_read(buf, buffer_f32 );
	newsong = buffer_read(buf, buffer_f32 );
	song = buffer_read(buf, buffer_f32 );
	index = buffer_read(buf, buffer_f16 );
	show_date = buffer_read(buf, buffer_u8 );
	sprite = buffer_read(buf, buffer_u32 );
	start = buffer_read(buf, buffer_u8 );
	global.loaded = buffer_read(buf, buffer_f32 );
	width = buffer_read(buf, buffer_f32 );
	height = buffer_read(buf, buffer_f32 );
	global.mousex = buffer_read(buf, buffer_f32 );
	global.mousey = buffer_read(buf, buffer_f32 );
	lastbrus = buffer_read(buf, buffer_f32 );
	brus = buffer_read(buf, buffer_f32 );
	ammoy = buffer_read(buf, buffer_f32 );
	levelshow = buffer_read(buf, buffer_f32 );
	save = buffer_read(buf, buffer_f32 );
	leveltitle = buffer_read(buf, buffer_string );
}