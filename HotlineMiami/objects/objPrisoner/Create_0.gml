image_speed = 0;
direction = 180;
speed = 0.5;
image_speed = 0.1;
on = 1;
turn = 1;
state = 0;
alert = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_u8, state );
	buffer_write( global.tempSave[room], buffer_f16, turn );
	buffer_write( global.tempSave[room], buffer_u8, on );
	buffer_write( global.tempSave[room], buffer_u8, alert );


}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	state = buffer_read(global.tempSave[room], buffer_u8 );
	turn = buffer_read(global.tempSave[room], buffer_f16 );
	on = buffer_read(global.tempSave[room], buffer_u8 );
	alert = buffer_read(global.tempSave[room], buffer_u8 );
}