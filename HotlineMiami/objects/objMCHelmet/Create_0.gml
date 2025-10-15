friction = 0.1;
rotspeed = (-1 + round(random(1)) * 2) * random(8);
startspeed = 0;
image_speed = 0;
image_angle = random(360);
image_index = choose(0, 1);

DoSave = function(buf) {
	buffer_write(buf, buffer_f32, rotspeed);
	buffer_write(buf, buffer_f32, startspeed);
}
DoLoad = function () {
	rotspeed = buffer_read(buf, buffer_f32);
	startspeed = buffer_read(buf, buffer_f32);
}