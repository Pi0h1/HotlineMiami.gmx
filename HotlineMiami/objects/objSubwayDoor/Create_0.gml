image_speed = 0;
spawned = 0;
wait = 100;
wait2 = 100;
on = 0;
global.opensound = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write(global.tempSave[room], buffer_u8, spawned);
	buffer_write(global.tempSave[room], buffer_f32, wait);
	buffer_write(global.tempSave[room], buffer_f32, wait2);
	buffer_write(global.tempSave[room], buffer_u8, on);
	buffer_write(global.tempSave[room], buffer_u8, global.opensound);
	buffer_write(global.tempSave[room], buffer_u8, visible);
	buffer_write(global.tempSave[room], buffer_u8, solid);
	buffer_write(global.tempSave[room], buffer_f32, alarm[0]);
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	spawned = buffer_read(global.tempSave[room], buffer_u8);
	wait = buffer_read(global.tempSave[room], buffer_f32);
	wait2 = buffer_read(global.tempSave[room], buffer_f32);
	on = buffer_read(global.tempSave[room], buffer_u8);
	global.opensound = buffer_read(global.tempSave[room], buffer_u8);
	visible = buffer_read(global.tempSave[room], buffer_u8);
	solid = buffer_read(global.tempSave[room], buffer_u8);
	alarm[0] = buffer_read(global.tempSave[room], buffer_f32);
}