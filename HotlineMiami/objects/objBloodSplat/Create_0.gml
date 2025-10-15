image_speed = 0;
image_angle = random(360);
advancespeed = 0.2 + random(0.05);
done = 0;
image_alpha = 1;
image_blend = merge_color(c_red, c_maroon, random(0.1));

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, advancespeed );
	buffer_write( buf, buffer_f32, done );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	advancespeed = buffer_read(buf, buffer_f32 );
	done = buffer_read(buf, buffer_f32 );
}