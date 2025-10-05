image_speed = 0;
friction = 0.1;
image_yscale = -1 + round(random(1)) * 2;
bled = 0;
wait = 500;
life = 100 + random(60);
SteamIncStat("Kills", 1);

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, bled );
	buffer_write( global.tempSave[room], buffer_f32, wait );
	buffer_write( global.tempSave[room], buffer_f32, life );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	bled = buffer_read(global.tempSave[room], buffer_f32 );
	wait = buffer_read(global.tempSave[room], buffer_f32 );
	life = buffer_read(global.tempSave[room], buffer_f32 );
}