scrPoliceStaticInit();

image_speed = 0;
image_index = random(1000);
angle = random(360);

direction = angle;
alarm[0] = 120 + random(120);
energie = round(random(1));

checkreload = floor(random(30));
ammo = 24;
alert = 0;
reload = 13;
light = 0;

start_x = x;
start_y = y;
weaponfind = 0;
shake = 0;

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
	buffer_write( global.tempSave[room], buffer_f32, weaponfind );
	buffer_write( global.tempSave[room], buffer_f32, shake );
	buffer_write( global.tempSave[room], buffer_f32, angle );
	buffer_write( global.tempSave[room], buffer_f32, check );
	buffer_write( global.tempSave[room], buffer_f32, startx );
	buffer_write( global.tempSave[room], buffer_f32, starty );
	buffer_write( global.tempSave[room], buffer_f32, returning );
	buffer_write( global.tempSave[room], buffer_f32, armed );
	buffer_write( global.tempSave[room], buffer_f32, turn );
	buffer_write( global.tempSave[room], buffer_f32, alertwait );
	buffer_write( global.tempSave[room], buffer_f32, diradd );
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
	weaponfind = buffer_read(global.tempSave[room], buffer_f32 );
	shake = buffer_read(global.tempSave[room], buffer_f32 );
	angle = buffer_read(global.tempSave[room], buffer_f32 );
	check = buffer_read(global.tempSave[room], buffer_f32 );
	startx = buffer_read(global.tempSave[room], buffer_f32 );
	starty = buffer_read(global.tempSave[room], buffer_f32 );
	returning = buffer_read(global.tempSave[room], buffer_f32 );
	armed = buffer_read(global.tempSave[room], buffer_f32 );
	turn = buffer_read(global.tempSave[room], buffer_f32 );
	alertwait = buffer_read(global.tempSave[room], buffer_f32 );
	diradd = buffer_read(global.tempSave[room], buffer_f32 );
}