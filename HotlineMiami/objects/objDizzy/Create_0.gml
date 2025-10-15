draw_clear(c_black);
screen_refresh();
surface_free(global.surf2);
global.surf2 = surface_create(view_get_wport(0), view_get_hport(0));
surface_set_target(global.surf2);
draw_clear_alpha(make_color_hsv(0, 0, 2), 0);
surface_alpha();
surface_reset_target();

save = 0;
global.draw = true;
dizziness = 0.1;
myx1 = 0;
myy1 = 0;
myx2 = 0;
myy2 = 0;
h1 = 0;
h2 = 155;
dir = random(10000);
noiseindex = 0;

DoSave = function(buf) {
	buffer_write(buf, buffer_f32, save);
	buffer_write(buf, buffer_u8, global.draw);
	buffer_write(buf, buffer_f32, dizziness);
	buffer_write(buf, buffer_f32, myx1);
	buffer_write(buf, buffer_f32, myy1);
	buffer_write(buf, buffer_f32, myx2);
	buffer_write(buf, buffer_f32, myy2);
	buffer_write(buf, buffer_f32, h1);
	buffer_write(buf, buffer_f32, h2);
	buffer_write(buf, buffer_f32, dir);
	buffer_write(buf, buffer_f32, noiseindex);
}
DoLoad = function(buf) {
	save = buffer_read(buf, buffer_f32);
	global.draw = buffer_read(buf, buffer_u8);
	dizziness = buffer_read(buf, buffer_f32);
	myx1 = buffer_read(buf, buffer_f32);
	myy1 = buffer_read(buf, buffer_f32);
	myx2 = buffer_read(buf, buffer_f32);
	myy2 = buffer_read(buf, buffer_f32);
	h1 = buffer_read(buf, buffer_f32);
	h2 = buffer_read(buf, buffer_f32);
	dir = buffer_read(buf, buffer_f32);
	noiseindex = buffer_read(buf, buffer_f32);
}