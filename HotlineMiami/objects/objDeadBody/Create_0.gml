image_speed = 0;
friction = 0.1;
image_yscale = -1 + round(random(1)) * 2;
bled = 0;
wait = 500;
life = 100 + random(60);
SteamIncStat("Kills", 1);

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, bled );
	buffer_write( buf, buffer_f32, wait );
	buffer_write( buf, buffer_f32, life );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	bled = buffer_read(buf, buffer_f32 );
	wait = buffer_read(buf, buffer_f32 );
	life = buffer_read(buf, buffer_f32 );
}