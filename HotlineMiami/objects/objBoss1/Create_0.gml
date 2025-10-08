image_speed = 0;
image_index = random(1000);
energie = 2;
scrInitPathFinding();
path = path_add();
path_set_kind(path, 1);
path_set_precision(path, 2);
state = 0;
wait = 30;
hit = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, energie );
	buffer_write( global.tempSave[room], buffer_u16, state );
	buffer_write( global.tempSave[room], buffer_f32, wait );
	buffer_write( global.tempSave[room], buffer_u8, hit );


}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	energie = buffer_read(global.tempSave[room], buffer_f32 );
	state = buffer_read(global.tempSave[room], buffer_u16 );
	wait = buffer_read(global.tempSave[room], buffer_f32 );
	hit = buffer_read(global.tempSave[room], buffer_u8 );
}