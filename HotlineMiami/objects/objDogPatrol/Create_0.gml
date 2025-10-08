scrDogInit();
image_speed = 0;
image_index = random(1000);
speed = 1;
image_speed = 0.1;
energie = round(random(1));

checkreload = floor(random(30));
ammo = 24;
alert = 0;
reload = 13;
light = 0;
start_x = x;
start_y = y;
stopchase = 0;
add = 1;

gotowall = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, energie );
	buffer_write( global.tempSave[room], buffer_f32, checkreload );
	buffer_write( global.tempSave[room], buffer_f32, ammo );
	buffer_write( global.tempSave[room], buffer_f32, alert );
	buffer_write( global.tempSave[room], buffer_f32, reload );
	buffer_write( global.tempSave[room], buffer_f32, light );
	buffer_write( global.tempSave[room], buffer_f32, start_x );
	buffer_write( global.tempSave[room], buffer_f32, start_y );
	buffer_write( global.tempSave[room], buffer_f32, stopchase );
	buffer_write( global.tempSave[room], buffer_f32, add );
	buffer_write( global.tempSave[room], buffer_f32, gotowall );
	buffer_write( global.tempSave[room], buffer_u8, findwall );
	buffer_write( global.tempSave[room], buffer_u8, check );
	buffer_write( global.tempSave[room], buffer_u8, armed );
	buffer_write( global.tempSave[room], buffer_f32, startx );
	buffer_write( global.tempSave[room], buffer_f32, starty );
	buffer_write( global.tempSave[room], buffer_f32, startdir );
	buffer_write( global.tempSave[room], buffer_f32, returning );
	buffer_write( global.tempSave[room], buffer_f32, turn );
	buffer_write( global.tempSave[room], buffer_f32, diradd );
	buffer_write( global.tempSave[room], buffer_f32, dir );
	buffer_write( global.tempSave[room], buffer_f32, alertwait );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	energie = buffer_read(global.tempSave[room], buffer_f32 );
	checkreload = buffer_read(global.tempSave[room], buffer_f32 );
	ammo = buffer_read(global.tempSave[room], buffer_f32 );
	alert = buffer_read(global.tempSave[room], buffer_f32 );
	reload = buffer_read(global.tempSave[room], buffer_f32 );
	light = buffer_read(global.tempSave[room], buffer_f32 );
	start_x = buffer_read(global.tempSave[room], buffer_f32 );
	start_y = buffer_read(global.tempSave[room], buffer_f32 );
	stopchase = buffer_read(global.tempSave[room], buffer_f32 );
	add = buffer_read(global.tempSave[room], buffer_f32 );
	gotowall = buffer_read(global.tempSave[room], buffer_f32 );
	findwall = buffer_read(global.tempSave[room], buffer_u8 );
	check = buffer_read(global.tempSave[room], buffer_u8 );
	armed = buffer_read(global.tempSave[room], buffer_u8 );
	startx = buffer_read(global.tempSave[room], buffer_f32 );
	starty = buffer_read(global.tempSave[room], buffer_f32 );
	startdir = buffer_read(global.tempSave[room], buffer_f32 );
	returning = buffer_read(global.tempSave[room], buffer_f32 );
	turn = buffer_read(global.tempSave[room], buffer_f32 );
	diradd = buffer_read(global.tempSave[room], buffer_f32 );
	dir = buffer_read(global.tempSave[room], buffer_f32 );
	alertwait = buffer_read(global.tempSave[room], buffer_f32 );
}