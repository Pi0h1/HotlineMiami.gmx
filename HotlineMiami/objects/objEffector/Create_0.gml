if (global.xbox)
    scrInitXboxButtons();
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
//global.loaded = 0;
nextroom = room_next(room);
newsong = 0;
song = -1;
blackx = 0;
bamount = 0;
width = display_get_width();
height = display_get_height();
global.mousex = (display_mouse_get_x() - width * 0.5) * (camera_get_view_width(view_camera[0]) / width);
global.mousey = (display_mouse_get_y() - height * 0.5) * (camera_get_view_height(view_camera[0]) / height);
vlastx = camera_get_view_x(view_camera[0]);
vlasty = camera_get_view_y(view_camera[0]);
global.enemy = -1234;
leveltitle = "";
levelshow = 240;
gridon = 0; // debug command that draws debug for the ai
uzisnd = 0;
// Addresses used for display when level starts
if (instance_exists(objMaskMenu)) {
    switch (global.sequence) {
        case rmSequence1: leveltitle = "Brickell Metro Station"; break;
        case rmSequence2: leveltitle = "East 7th St"; break;
        case rmSequence3: leveltitle = "North West 184th St"; break;
        case rmSequence4: leveltitle = "South West 53rd Place"; break;
        case rmSequence5: leveltitle = "North West 24th St"; break;
        case rmSequence6: leveltitle = "South West 104th St"; break;
        case rmSequence7: leveltitle = "North West 151st Place"; break;
        case rmSequence8: leveltitle = "South East 122nd St"; break;
        case rmSequence9: leveltitle = "North East 165th "; break;
        case rmSequence10: leveltitle = "North East 24th St"; break;
        case rmSequence11: leveltitle = "East 7th St"; break;
        case rmSequence12: leveltitle = "South East 24th St"; break;
        case rmSequence13: leveltitle = "West 25th St"; break;
        case rmSequence14: leveltitle = "South 86th St"; break;
    }
}
if (instance_exists(objPlayerBiker)) { // This check is actually irrelevant but okay
    switch (global.sequence) {
        case rmNoodleShop: leveltitle = "North East 56th St"; break;
        case rmArcadeDownstairs: leveltitle = "South West 107th Place"; break;
        case rmPhoneHomEntranceBiker: leveltitle = "North West 342nd St"; break;
        case rmJanitors: leveltitle = "North 87th Place"; break;
    }
}

scrLockInEffectInit();

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
	buffer_write( buf, buffer_f32, newsong );
	buffer_write( buf, buffer_f32, song );
	buffer_write( buf, buffer_f32, blackx );
	buffer_write( buf, buffer_f32, bamount );
	buffer_write( buf, buffer_u32, width );
	buffer_write( buf, buffer_u32, height );
	buffer_write( buf, buffer_f32, global.mousex );
	buffer_write( buf, buffer_f32, global.mousey );
	buffer_write( buf, buffer_f32, vlastx );
	buffer_write( buf, buffer_f32, vlasty );
	buffer_write( buf, buffer_f32, global.enemy );
	buffer_write( buf, buffer_string, leveltitle );
	buffer_write( buf, buffer_f32, levelshow );
	buffer_write( buf, buffer_f32, gridon );
	buffer_write( buf, buffer_f32, uzisnd );

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
	newsong = buffer_read(buf, buffer_f32 );
	song = buffer_read(buf, buffer_f32 );
	blackx = buffer_read(buf, buffer_f32 );
	bamount = buffer_read(buf, buffer_f32 );
	width = buffer_read(buf, buffer_u32 );
	height = buffer_read(buf, buffer_u32 );
	global.mousex = buffer_read(buf, buffer_f32 );
	global.mousey = buffer_read(buf, buffer_f32 );
	vlastx = buffer_read(buf, buffer_f32 );
	vlasty = buffer_read(buf, buffer_f32 );
	global.enemy = buffer_read(buf, buffer_f32 );
	leveltitle = buffer_read(buf, buffer_string );
	levelshow = buffer_read(buf, buffer_f32 );
	gridon = buffer_read(buf, buffer_f32 );
	uzisnd = buffer_read(buf, buffer_f32 );
}