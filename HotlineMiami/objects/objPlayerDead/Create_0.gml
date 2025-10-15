image_speed = 0;
friction = 0.1;
image_yscale = -1 + round(random(1)) * 2;
bled = 0;
length = random(24);
dir = random(360);
vdist = 0;
vdir = 0;
viewspeed = 0;
viewdir = 0;
SteamIncStat("Deaths", 1);

DoSave = function(buf) {
	buffer_write(buf, buffer_u8, bled);
	buffer_write(buf, buffer_f32, length);
	buffer_write(buf, buffer_f32, dir);
	buffer_write(buf, buffer_f32, vdist);
	buffer_write(buf, buffer_f32, vdir);
	buffer_write(buf, buffer_f32, viewspeed);
	buffer_write(buf, buffer_f32, viewdir);
}
DoLoad = function(buf) {
	bled = buffer_read(buf, buffer_u8);
	length = buffer_read(buf, buffer_f32);
	dir = buffer_read(buf, buffer_f32);
	vdist = buffer_read(buf, buffer_f32);
	vdir = buffer_read(buf, buffer_f32);
	viewspeed = buffer_read(buf, buffer_f32);
	viewdir = buffer_read(buf, buffer_f32);
}